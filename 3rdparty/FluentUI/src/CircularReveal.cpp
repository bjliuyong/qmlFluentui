#include "CircularReveal.h"
#include <QGuiApplication>
#include <QQuickItemGrabResult>
#include <QTimer>
#include <QPainterPath>

CircularReveal::CircularReveal(QQuickItem *parent) : QQuickPaintedItem(parent) {
    _target = nullptr;
    _radius = 0;
    _anim = new QPropertyAnimation(this, "radius", this);
    _anim->setDuration(450);
    _anim->setEasingCurve(QEasingCurve::InOutCubic);
    setVisible(false);
    connect(_anim, &QPropertyAnimation::finished, this, [=]() {
        update();
        setVisible(false);
        Q_EMIT animationFinished();
    });
    connect(this, &CircularReveal::radiusChanged, this, [=]() { update(); });
}

void CircularReveal::paint(QPainter *painter) {
    if (_source.isNull()) return;
    painter->save();
    // 确保 1:1 绘制。destRect 是逻辑像素。
    // QPainter 已被系统 transform 缩放，drawImage 会自动处理 DPR 图像。
    QRectF destRect(0, 0, width(), height());
    painter->drawImage(destRect, _source);

    QPainterPath path;
    // _center 和 _radius 均基于逻辑坐标
    path.addEllipse(QPointF(_center.x(), _center.y()), _radius, _radius);

    // 核心修复：永远只扣除圆孔，让底层的新主题从圆孔中透出来
    // 删除了原先错误的 _darkToLight 判断分支
    painter->setCompositionMode(QPainter::CompositionMode_Clear);
    painter->fillPath(path, Qt::white);

    painter->restore();
}

[[maybe_unused]] void CircularReveal::start(int w, int h, const QPoint &center, int radius) {
    if (_anim->state() == QAbstractAnimation::Running) {
        _anim->stop();
    }
    _radius = 0; // Reset radius for new animation
    _targetRadius = radius;
    _center = center;
    
    // Clean up previous grab if any
    if (_grabResult) {
        disconnect(_grabResult.data(), &QQuickItemGrabResult::ready, this, &CircularReveal::handleGrabResult);
        _grabResult.clear();
    }

    _grabResult = _target->grabToImage(QSize(w, h));
    connect(_grabResult.data(), &QQuickItemGrabResult::ready, this, &CircularReveal::handleGrabResult, Qt::SingleShotConnection);
}

void CircularReveal::handleGrabResult() {
    if (!_grabResult) return;
    _grabResult.data()->image().swap(_source);
    _grabResult.clear();
    update();
    setVisible(true);
    
    // 触发 QML 更新主题，此时底层窗口已开始准备新主题渲染，
    // 而本组件（CircularReveal）已携带旧截图覆盖在其上方。
    Q_EMIT imageChanged(); 
    _anim->setEndValue(_targetRadius);
    _anim->start();
}
