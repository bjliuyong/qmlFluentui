// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts
// import FluentUI
//
// Window {
//     default property alias contentData : layout_content.data
//     property string windowIcon: FluApp.windowIcon
//     property int launchMode: FluWindowType.Standard
//     property var argument:({})
//     property var background : com_background
//     property bool fixSize: false
//     property Component loadingItem: com_loading
//     property bool fitsAppBarWindows: false
//     property var tintOpacity: FluTheme.dark ? 0.80 : 0.75
//     property int blurRadius: 60
//     property alias effect: frameless.effect
//     property var leftBar
//     readonly property alias effective: frameless.effective
//     readonly property alias availableEffects: frameless.availableEffects
//     // 是否启用加载动画
//     property bool enableStartupAnimation: true
//     property Item appBar: FluAppBar {
//         title: window.title
//         height: 30
//         showDark: window.showDark
//         showClose: window.showClose
//         showMinimize: window.showMinimize
//         showMaximize: window.showMaximize
//         showStayTop: window.showStayTop
//         icon: window.windowIcon
//     }
//     property color backgroundColor: {
//         if(frameless.effective && active){
//             var backcolor
//             if(frameless.effect==="dwm-blur"){
//                 backcolor = FluTools.withOpacity(FluTheme.windowActiveBackgroundColor, window.tintOpacity)
//             }else{
//                 backcolor =  "transparent"
//             }
//             return backcolor
//         }
//         if(active){
//             return FluTheme.windowActiveBackgroundColor
//         }
//         return FluTheme.windowBackgroundColor
//     }
//     property bool stayTop: false
//     property bool showDark: false
//     property bool showClose: true
//     property bool showMinimize: true
//     property bool showMaximize: true
//     property bool showStayTop: false
//     property bool autoMaximize: false
//     property bool autoVisible: true
//     property bool autoCenter: true
//     property bool autoDestroy: true
//     property bool useSystemAppBar
//     property int __margins: 0
//     property color resizeBorderColor: {
//         if(window.active){
//             return  FluTheme.windowBackgroundColor
//         }
//         return  FluTheme.windowActiveBackgroundColor
//     }
//     property int resizeBorderWidth: 1
//     property var closeListener: function(event){
//         if(autoDestroy){
//             FluRouter.removeWindow(window)
//         }else{
//             window.visibility = Window.Hidden
//             event.accepted = false
//         }
//     }
//     signal initArgument(var argument)
//     signal lazyLoad()
//     property var _windowRegister
//     property string _route
//     property bool _hideShadow: false
//     id: window
//     color: window.backgroundColor
//     Component.onCompleted: {
//         FluRouter.addWindow(window)
//         useSystemAppBar = FluApp.useSystemAppBar
//         if(!useSystemAppBar && autoCenter){
//             moveWindowToDesktopCenter()
//         }
//         fixWindowSize()
//         initArgument(argument)
//         if(window.autoVisible){
//             if(window.autoMaximize){
//                 window.visibility = Window.Maximized
//             }else{
//                 window.show()
//             }
//         }
//     }
//     onVisibleChanged: {
//         if(visible && d.isLazyInit){
//             window.lazyLoad()
//             d.isLazyInit = false
//         }
//     }
//     QtObject{
//         id:d
//         property bool isLazyInit: true
//     }
//     Connections{
//         target: window
//         function onClosing(event){closeListener(event)}
//     }
//     FluFrameless{
//         id: frameless
//         appbar: window.appBar
//         maximizeButton: appBar.buttonMaximize
//         fixSize: window.fixSize
//         topmost: window.stayTop
//         disabled: FluApp.useSystemAppBar
//         isDarkMode: FluTheme.dark
//         useSystemEffect: !FluTheme.blurBehindWindowEnabled
//         Component.onCompleted: {
//             frameless.setHitTestVisible(appBar.layoutMacosButtons)
//             frameless.setHitTestVisible(appBar.layoutStandardbuttons)
//         }
//         Component.onDestruction: {
//             frameless.onDestruction()
//         }
//         onEffectiveChanged: {
//             if(effective){
//                 FluTheme.blurBehindWindowEnabled = false
//             }
//         }
//     }
//     Component{
//         id:com_background
//         Item{
//             Rectangle{
//                 anchors.fill: parent
//                 color: window.backgroundColor
//             }
//             Image{
//                 id:img_back
//                 visible: false
//                 cache: false
//                 fillMode: Image.PreserveAspectCrop
//                 asynchronous: true
//                 Component.onCompleted: {
//                     img_back.updateLayout()
//                     source = FluTools.getUrlByFilePath(FluTheme.desktopImagePath)
//                 }
//                 Connections{
//                     target: window
//                     function onScreenChanged(){
//                         img_back.updateLayout()
//                     }
//                 }
//                 function updateLayout(){
//                     var geometry = FluTools.desktopAvailableGeometry(window)
//                     img_back.width = geometry.width
//                     img_back.height =  geometry.height
//                     img_back.sourceSize = Qt.size(img_back.width,img_back.height)
//                 }
//                 Connections{
//                     target: FluTheme
//                     function onDesktopImagePathChanged(){
//                         timer_update_image.restart()
//                     }
//                     function onBlurBehindWindowEnabledChanged(){
//                         if(FluTheme.blurBehindWindowEnabled){
//                             img_back.source = FluTools.getUrlByFilePath(FluTheme.desktopImagePath)
//                         }else{
//                             img_back.source = ""
//                         }
//                     }
//                 }
//                 Timer{
//                     id:timer_update_image
//                     interval: 150
//                     onTriggered: {
//                         img_back.source = ""
//                         img_back.source = FluTools.getUrlByFilePath(FluTheme.desktopImagePath)
//                     }
//                 }
//             }
//             FluAcrylic{
//                 anchors.fill: parent
//                 target: img_back
//                 tintOpacity: window.tintOpacity
//                 blurRadius: window.blurRadius
//                 visible: window.active && FluTheme.blurBehindWindowEnabled
//                 tintColor:  FluTheme.textHighlightColor
//                 targetRect: Qt.rect(window.x-window.screen.virtualX,window.y-window.screen.virtualY,window.width,window.height)
//             }
//         }
//     }
//     Component{
//         id:com_app_bar
//         Item{
//             data: window.appBar
//             Component.onCompleted: {
//                 window.appBar.width = Qt.binding(function(){
//                     return this.parent.width
//                 })
//             }
//         }
//     }
//     Component{
//         id:com_loading
//         Popup{
//             id:popup_loading
//             focus: true
//             width: window.width
//             height: window.height
//             anchors.centerIn: Overlay.overlay
//             closePolicy: {
//                 if(cancel){
//                     return Popup.CloseOnEscape | Popup.CloseOnPressOutside
//                 }
//                 return Popup.NoAutoClose
//             }
//             Overlay.modal: Item {}
//             onVisibleChanged: {
//                 if(!visible){
//                     loader_loading.sourceComponent = undefined
//                 }
//             }
//             padding: 0
//             opacity: 0
//             visible:true
//             Behavior on opacity {
//                 SequentialAnimation {
//                     PauseAnimation {
//                         duration: 83
//                     }
//                     NumberAnimation{
//                         duration:  167
//                     }
//                 }
//             }
//             Component.onCompleted: {
//                 opacity = 1
//             }
//             background: Rectangle{
//                 color:"#44000000"
//             }
//             contentItem: Item{
//                 MouseArea{
//                     anchors.fill: parent
//                     onClicked: {
//                         if (cancel){
//                             popup_loading.visible = false
//                         }
//                     }
//                 }
//                 ColumnLayout{
//                     spacing: 8
//                     anchors.centerIn: parent
//                     FluProgressRing{
//                         Layout.alignment: Qt.AlignHCenter
//                     }
//                     FluText{
//                         text:loadingText
//                         Layout.alignment: Qt.AlignHCenter
//                     }
//                 }
//             }
//         }
//     }
//     Component{
//         id:com_border
//         Rectangle{
//             color:"transparent"
//             border.width: window.resizeBorderWidth
//             border.color: window.resizeBorderColor
//         }
//     }
//     Item{
//         id: layout_container
//         anchors.fill: parent
//         anchors.margins: window.__margins
//         FluLoader{
//             anchors.fill: parent
//             sourceComponent: background
//         }
//         // 动画的初始状态 (如果开启了动画，就先全透明、缩小并下移 20px)
//         opacity: window.enableStartupAnimation ? 0 : 1
//         scale: window.enableStartupAnimation ? 0.9 : 1.0
//         transform: Translate {
//             id: startTranslate
//             y: window.enableStartupAnimation ? 20 : 0
//         }
//
//         //定义启动动画
//         ParallelAnimation {
//             id: startupAnimation
//             NumberAnimation {
//                 target: layout_container
//                 property: "opacity"
//                 to: 1
//                 duration: 400
//                 easing.type: Easing.OutQuad
//             }
//             NumberAnimation {
//                 target: layout_container
//                 property: "scale"
//                 to: 1
//                 duration: 450
//                 easing.type: Easing.OutBack
//                 easing.amplitude: 1.2
//             }
//             NumberAnimation {
//                 target: startTranslate
//                 property: "y"
//                 to: 0
//                 duration: 450
//                 easing.type: Easing.OutCubic
//             }
//         }
//         //组件加载完毕后，判断是否需要播放动画
//         Component.onCompleted: {
//             if(window.enableStartupAnimation){
//                 startupAnimation.start()
//             }
//         }
//
//         Item{
//             id: layout_content
//             anchors{
//                 top: loader_app_bar.bottom
//                 left: loader_left_bar.visible ? loader_left_bar.right : parent.left
//                 right: parent.right
//                 bottom: parent.bottom
//             }
//             clip: true
//         }
//         Item{
//             id:loader_left_bar
//             anchors {
//                 top: parent.top
//                 left: parent.left
//                 bottom: parent.bottom
//             }
//             width: 40
//             visible: window.leftBar !== undefined
//             FluLoader{
//                 id: left_bar_loader
//                 anchors.fill: parent
//                 sourceComponent: window.leftBar instanceof Component ? window.leftBar : undefined
//             }
//             onVisibleChanged: {
//                 if(visible && (window.leftBar instanceof Item)){
//                     window.leftBar.parent = loader_left_bar
//                     window.leftBar.anchors.fill = loader_left_bar
//                 }
//             }
//             Component.onCompleted: {
//                 if(window.leftBar instanceof Item){
//                     window.leftBar.parent = loader_left_bar
//                     window.leftBar.anchors.fill = loader_left_bar
//                 }
//             }
//         }
//         FluLoader{
//             id:loader_app_bar
//             anchors {
//                 top: parent.top
//                 left: loader_left_bar.visible ? loader_left_bar.right : parent.left
//                 right: parent.right
//             }
//             height: {
//                 if(window.useSystemAppBar){
//                     return 0
//                 }
//                 return window.fitsAppBarWindows ? 0 : window.appBar.height
//             }
//             sourceComponent: window.useSystemAppBar ? undefined : com_app_bar
//         }
//         FluLoader{
//             property string loadingText
//             property bool cancel: false
//             id:loader_loading
//             anchors.fill: parent
//         }
//         FluInfoBar{
//             id:info_bar
//             root: layout_container
//         }
//         FluLoader{
//             id:loader_border
//             anchors.fill: parent
//             sourceComponent: {
//                 if(window.useSystemAppBar || FluTools.isWin() || window.visibility === Window.Maximized || window.visibility === Window.FullScreen){
//                     return undefined
//                 }
//                 return com_border
//             }
//         }
//     }
//     function hideLoading(){
//         loader_loading.sourceComponent = undefined
//     }
//     function showSuccess(text,duration,moremsg){
//         return info_bar.showSuccess(text,duration,moremsg)
//     }
//     function showInfo(text,duration,moremsg){
//         return info_bar.showInfo(text,duration,moremsg)
//     }
//     function showWarning(text,duration,moremsg){
//         return info_bar.showWarning(text,duration,moremsg)
//     }
//     function showError(text,duration,moremsg){
//         return info_bar.showError(text,duration,moremsg)
//     }
//     function clearAllInfo(){
//         return info_bar.clearAllInfo()
//     }
//     function moveWindowToDesktopCenter(){
//         var availableGeometry = FluTools.desktopAvailableGeometry(window)
//         window.setGeometry((availableGeometry.width-window.width)/2+Screen.virtualX,(availableGeometry.height-window.height)/2+Screen.virtualY,window.width,window.height)
//     }
//     function fixWindowSize(){
//         if(fixSize){
//             window.maximumWidth =  window.width
//             window.maximumHeight =  window.height
//             window.minimumWidth = window.width
//             window.minimumHeight = window.height
//         }
//     }
//     function setResult(data){
//         if(_windowRegister){
//             _windowRegister.setResult(data)
//         }
//     }
//     function showMaximized(){
//         frameless.showMaximized()
//     }
//     function showMinimized(){
//         frameless.showMinimized()
//     }
//     function showNormal(){
//         frameless.showNormal()
//     }
//     function showLoading(text = "",cancel = true){
//         if(text===""){
//             text = qsTr("Loading...")
//         }
//         loader_loading.loadingText = text
//         loader_loading.cancel = cancel
//         loader_loading.sourceComponent = com_loading
//     }
//     function setHitTestVisible(val){
//         frameless.setHitTestVisible(val)
//     }
//     function deleteLater(){
//         FluTools.deleteLater(window)
//     }
//     function containerItem(){
//         return layout_container
//     }
//
//     function startReveal(button, callback) {
//         theme_reveal.start(button, callback)
//     }
//
//     FluThemeReveal {
//         id: theme_reveal
//         z: 65535
//         anchors.fill: parent
//         target: layout_container
//     }
// }
//
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window               // 【新增】用于获取 Screen 屏幕尺寸
import Qt5Compat.GraphicalEffects   // 【新增】用于实现 DropShadow 阴影 (Qt6 环境下)
import FluentUI

Window {
    default property alias contentData : layout_content.data
    property string windowIcon: FluApp.windowIcon
    property int launchMode: FluWindowType.Standard
    property var argument:({})
    property var background : com_background
    property bool fixSize: false
    property Component loadingItem: com_loading
    property bool fitsAppBarWindows: false
    property var tintOpacity: FluTheme.dark ? 0.80 : 0.75
    property int blurRadius: 60
    property alias effect: frameless.effect
    property var leftBar
    readonly property alias effective: frameless.effective
    readonly property alias availableEffects: frameless.availableEffects
    // 是否启用加载动画
    property bool enableStartupAnimation: true
    property Item appBar: FluAppBar {
        title: window.title
        height: 30
        showDark: window.showDark
        showClose: window.showClose
        showMinimize: window.showMinimize
        showMaximize: window.showMaximize
        showStayTop: window.showStayTop
        icon: window.windowIcon
    }
    property color backgroundColor: {
        if(frameless.effective && active){
            var backcolor
            if(frameless.effect==="dwm-blur"){
                backcolor = FluTools.withOpacity(FluTheme.windowActiveBackgroundColor, window.tintOpacity)
            }else{
                backcolor =  "transparent"
            }
            return backcolor
        }
        if(active){
            return FluTheme.windowActiveBackgroundColor
        }
        return FluTheme.windowBackgroundColor
    }
    property bool stayTop: false
    property bool showDark: false
    property bool showClose: true
    property bool showMinimize: true
    property bool showMaximize: true
    property bool showStayTop: false
    property bool autoMaximize: false
    property bool autoVisible: true
    property bool autoCenter: false
    property bool autoDestroy: true
    property bool useSystemAppBar
    property int __margins: 0
    property color resizeBorderColor: {
        if(window.active){
            return  FluTheme.windowBackgroundColor
        }
        return  FluTheme.windowActiveBackgroundColor
    }
    property int resizeBorderWidth: 1
    property var closeListener: function(event){
        if(autoDestroy){
            FluRouter.removeWindow(window)
        }else{
            window.visibility = Window.Hidden
            event.accepted = false
        }
    }
    signal initArgument(var argument)
    signal lazyLoad()
    property var _windowRegister
    property string _route
    property bool _hideShadow: false

    id: window
    color: "transparent"

    // 【修改点 1】：配置窗口默认打开时的自适应大小和位置
    // 高 DPI 下使用 Screen.devicePixelRatio 将物理边距等效换算为逻辑坐标
    property int defaultX: Math.round(50 / Screen.devicePixelRatio)
    property int defaultY: Math.round(40 / Screen.devicePixelRatio)
    property int defaultWidth: Screen.width - Math.round(100 / Screen.devicePixelRatio)
    property int defaultHeight: Screen.height - Math.round(50 / Screen.devicePixelRatio)

    x: autoCenter ? (Screen.width - width) / 2 + Screen.virtualX : defaultX
    y: autoCenter ? (Screen.height - height) / 2 + Screen.virtualY : defaultY
    width: defaultWidth
    height: defaultHeight

    Component.onCompleted: {
        FluRouter.addWindow(window)
        useSystemAppBar = FluApp.useSystemAppBar
        if(!useSystemAppBar && autoCenter){
            moveWindowToDesktopCenter()
        }
        fixWindowSize()
        initArgument(argument)
        if(window.autoVisible){
            if(window.autoMaximize){
                window.visibility = Window.Maximized
            }else{
                window.show()
            }
        }
    }
    onVisibleChanged: {
        if(visible && d.isLazyInit){
            window.lazyLoad()
            d.isLazyInit = false
        }
    }
    QtObject{
        id:d
        property bool isLazyInit: true
    }
    Connections{
        target: window
        function onClosing(event){closeListener(event)}
    }
    FluFrameless{
        id: frameless
        appbar: window.appBar
        maximizeButton: appBar.buttonMaximize
        fixSize: window.fixSize
        topmost: window.stayTop
        disabled: FluApp.useSystemAppBar
        isDarkMode: FluTheme.dark
        useSystemEffect: !FluTheme.blurBehindWindowEnabled
        Component.onCompleted: {
            frameless.setHitTestVisible(appBar.layoutMacosButtons)
            frameless.setHitTestVisible(appBar.layoutStandardbuttons)
        }
        Component.onDestruction: {
            frameless.onDestruction()
        }
        onEffectiveChanged: {
            if(effective){
                FluTheme.blurBehindWindowEnabled = false
            }
        }
    }
    Component{
        id:com_background
        Item{
            Rectangle{
                anchors.fill: parent
                color: window.backgroundColor
            }
            Image{
                id:img_back
                visible: false
                cache: false
                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                Component.onCompleted: {
                    img_back.updateLayout()
                    source = FluTools.getUrlByFilePath(FluTheme.desktopImagePath)
                }
                Connections{
                    target: window
                    function onScreenChanged(){
                        img_back.updateLayout()
                    }
                }
                function updateLayout(){
                    var geometry = FluTools.desktopAvailableGeometry(window)
                    img_back.width = geometry.width
                    img_back.height =  geometry.height
                    img_back.sourceSize = Qt.size(img_back.width,img_back.height)
                }
                Connections{
                    target: FluTheme
                    function onDesktopImagePathChanged(){
                        timer_update_image.restart()
                    }
                    function onBlurBehindWindowEnabledChanged(){
                        if(FluTheme.blurBehindWindowEnabled){
                            img_back.source = FluTools.getUrlByFilePath(FluTheme.desktopImagePath)
                        }else{
                            img_back.source = ""
                        }
                    }
                }
                Timer{
                    id:timer_update_image
                    interval: 150
                    onTriggered: {
                        img_back.source = ""
                        img_back.source = FluTools.getUrlByFilePath(FluTheme.desktopImagePath)
                    }
                }
            }
            FluAcrylic{
                anchors.fill: parent
                target: img_back
                tintOpacity: window.tintOpacity
                blurRadius: window.blurRadius
                // 【修改点 2】：启动动画运行期间，强制关闭高斯模糊提升 GPU 渲染帧率
                visible: window.active && FluTheme.blurBehindWindowEnabled && (typeof startupAnimation !== "undefined" && !startupAnimation.running)
                tintColor:  FluTheme.textHighlightColor
                targetRect: Qt.rect(window.x-window.screen.virtualX,window.y-window.screen.virtualY,window.width,window.height)
            }
        }
    }
    Component{
        id:com_app_bar
        Item{
            data: window.appBar
            Component.onCompleted: {
                window.appBar.width = Qt.binding(function(){
                    return this.parent.width
                })
            }
        }
    }
    Component{
        id:com_loading
        Popup{
            id:popup_loading
            focus: true
            width: window.width
            height: window.height
            anchors.centerIn: Overlay.overlay
            closePolicy: {
                if(cancel){
                    return Popup.CloseOnEscape | Popup.CloseOnPressOutside
                }
                return Popup.NoAutoClose
            }
            Overlay.modal: Item {}
            onVisibleChanged: {
                if(!visible){
                    loader_loading.sourceComponent = undefined
                }
            }
            padding: 0
            opacity: 0
            visible:true
            Behavior on opacity {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 83
                    }
                    NumberAnimation{
                        duration:  167
                    }
                }
            }
            Component.onCompleted: {
                opacity = 1
            }
            background: Rectangle{
                color:"#44000000"
            }
            contentItem: Item{
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if (cancel){
                            popup_loading.visible = false
                        }
                    }
                }
                ColumnLayout{
                    spacing: 8
                    anchors.centerIn: parent
                    FluProgressRing{
                        Layout.alignment: Qt.AlignHCenter
                    }
                    FluText{
                        text:loadingText
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
        }
    }
    Component{
        id:com_border
        Rectangle{
            color:"transparent"
            border.width: window.resizeBorderWidth
            border.color: window.resizeBorderColor
        }
    }

    Item{
        id: layout_container
        anchors.fill: parent
        // 左边和顶部不再预留阴影空间（彻底贴合消除假边框），仅右、下保留 10px 的阴影容纳区
        anchors.topMargin: window.__margins
        anchors.leftMargin: window.__margins
        anchors.rightMargin: window.__margins + 10
        anchors.bottomMargin: window.__margins + 10

        // 将底板与阴影作为背景的最底层放入 layout_container 中
        Rectangle {
            id: shadow_source
            anchors.fill: parent
            color: "black"
            radius: 8 // 给窗口本身一个柔和基底弧度
            visible: false
            z: -2
        }

        DropShadow {
            anchors.fill: shadow_source
            source: shadow_source
            // 彻底消除左、上阴影发散：只要 offset >= radius ，反方向就不会有任何柔光溢出
            horizontalOffset: 5
            verticalOffset: 5
            radius: 4
            samples: 9 // 采用极其低消耗的低采样配置以换取性能
            color: "#30000000"
            transparentBorder: true // 允许在边界外生成模糊纹理
            z: -1
            visible: !_hideShadow && window.visibility !== Window.Maximized && window.visibility !== Window.FullScreen && layout_container.opacity > 0
        }

        FluLoader{
            id: loader_background
            anchors.fill: parent
            sourceComponent: background
        }

        // 动画的初始状态 (去除 scale 以极大增强性能)
        opacity: window.enableStartupAnimation ? 0 : 1
        transform: Translate {
            id: startTranslate
            y: window.enableStartupAnimation ? 20 : 0
        }

        // 定义启动动画 (性能精简版：摒弃 GPU 开销极高的图层形变，仅保留经典的淡入和上浮)
        ParallelAnimation {
            id: startupAnimation
            NumberAnimation {
                target: layout_container
                property: "opacity"
                from: 0
                to: 1
                duration: 300
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                target: startTranslate
                property: "y"
                from: 20
                to: 0
                duration: 350
                easing.type: Easing.OutCubic
            }
        }

        Connections {
            target: window
            function onVisibleChanged() {
                if (window.visible && window.enableStartupAnimation) {
                    timer_startup_handler.restart()
                }
            }
        }
        Timer {
            id: timer_startup_handler
            interval: 80  // 增加延迟至 80ms，确保内部 Tab/NavigationView 等组件完成初始化动画，且不因 opacity>0 被提前看见
            repeat: false
            onTriggered: {
                startupAnimation.start()
            }
        }

        Item{
            id: layout_content
            anchors{
                top: loader_app_bar.bottom
                left: loader_left_bar.visible ? loader_left_bar.right : parent.left
                right: parent.right
                bottom: parent.bottom
            }
            clip: true
        }
        Item{
            id:loader_left_bar
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            width: 40
            visible: window.leftBar !== undefined
            FluLoader{
                id: left_bar_loader
                anchors.fill: parent
                sourceComponent: window.leftBar instanceof Component ? window.leftBar : undefined
            }
            onVisibleChanged: {
                if(visible && (window.leftBar instanceof Item)){
                    window.leftBar.parent = loader_left_bar
                    window.leftBar.anchors.fill = loader_left_bar
                }
            }
            Component.onCompleted: {
                if(window.leftBar instanceof Item){
                    window.leftBar.parent = loader_left_bar
                    window.leftBar.anchors.fill = loader_left_bar
                }
            }
        }
        FluLoader{
            id:loader_app_bar
            anchors {
                top: parent.top
                left: loader_left_bar.visible ? loader_left_bar.right : parent.left
                right: parent.right
            }
            height: {
                if(window.useSystemAppBar){
                    return 0
                }
                return window.fitsAppBarWindows ? 0 : window.appBar.height
            }
            sourceComponent: window.useSystemAppBar ? undefined : com_app_bar
        }
        FluLoader{
            property string loadingText
            property bool cancel: false
            id:loader_loading
            anchors.fill: parent
        }
        FluInfoBar{
            id:info_bar
            root: layout_container
        }
        FluLoader{
            id:loader_border
            anchors.fill: parent
            sourceComponent: {
                if(window.useSystemAppBar || FluTools.isWin() || window.visibility === Window.Maximized || window.visibility === Window.FullScreen){
                    return undefined
                }
                return com_border
            }
        }
    }

    function hideLoading(){
        loader_loading.sourceComponent = undefined
    }
    function showSuccess(text,duration,moremsg){
        return info_bar.showSuccess(text,duration,moremsg)
    }
    function showInfo(text,duration,moremsg){
        return info_bar.showInfo(text,duration,moremsg)
    }
    function showWarning(text,duration,moremsg){
        return info_bar.showWarning(text,duration,moremsg)
    }
    function showError(text,duration,moremsg){
        return info_bar.showError(text,duration,moremsg)
    }
    function clearAllInfo(){
        return info_bar.clearAllInfo()
    }
    function moveWindowToDesktopCenter(){
        var availableGeometry = FluTools.desktopAvailableGeometry(window)
        window.setGeometry((availableGeometry.width-window.width)/2+Screen.virtualX,(availableGeometry.height-window.height)/2+Screen.virtualY,window.width,window.height)
    }
    function fixWindowSize(){
        if(fixSize){
            window.maximumWidth =  window.width
            window.maximumHeight =  window.height
            window.minimumWidth = window.width
            window.minimumHeight = window.height
        }
    }
    function setResult(data){
        if(_windowRegister){
            _windowRegister.setResult(data)
        }
    }
    function showMaximized(){
        frameless.showMaximized()
    }
    function showMinimized(){
        frameless.showMinimized()
    }
    function showNormal(){
        frameless.showNormal()
    }
    function showLoading(text = "",cancel = true){
        if(text===""){
            text = qsTr("Loading...")
        }
        loader_loading.loadingText = text
        loader_loading.cancel = cancel
        loader_loading.sourceComponent = com_loading
    }
    function setHitTestVisible(val){
        frameless.setHitTestVisible(val)
    }
    function deleteLater(){
        FluTools.deleteLater(window)
    }
    function containerItem(){
        return layout_container
    }

    function startReveal(button, callback) {
        theme_reveal.start(button, callback)
    }

    FluThemeReveal {
        id: theme_reveal
        z: 65535
        target: layout_container
    }
}