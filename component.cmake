include("${CMAKE_CURRENT_LIST_DIR}/id.cmake")

byd__package__add_component(${package}
    qt3d
    qtactiveqt
    qtandroidextras
    qtbase
    qtcanvas3d
    qtcharts
    qtconnectivity
    qtdatavis3d
    qtdeclarative
    qtdoc
    qtgamepad
    qtgraphicaleffects
    qtimageformats
    qtlocation
    qtmacextras
    qtmultimedia
    qtnetworkauth
    qtpurchasing
    qtquickcontrols
    qtquickcontrols2
    qtremoteobjects
    qtscript
    qtscxml
    qtsensors
    qtserialbus
    qtserialport
    qtspeech
    qtsvg
    qttools
    qttranslations
    qtvirtualkeyboard
    qtwayland
    qtwebchannel
    qtwebengine
    qtwebglplugin
    qtwebsockets
    qtwebview
    qtwinextras
    qtx11extras
    qtxmlpatterns
)

byd__package__set_module_to_component(${package} "3DAnimation" "qt3d")
byd__package__set_module_to_component(${package} "3DCore" "qt3d")
byd__package__set_module_to_component(${package} "3DCoreTest" "qt3d")
byd__package__set_module_to_component(${package} "3DExtras" "qt3d")
byd__package__set_module_to_component(${package} "3DInput" "qt3d")
byd__package__set_module_to_component(${package} "3DLogic" "qt3d")
byd__package__set_module_to_component(${package} "3DQuickAnimation" "qt3d")
byd__package__set_module_to_component(${package} "3DQuickExtras" "qt3d")
byd__package__set_module_to_component(${package} "3DQuickInput" "qt3d")
byd__package__set_module_to_component(${package} "3DQuick" "qt3d")
byd__package__set_module_to_component(${package} "3DQuickRender" "qt3d")
byd__package__set_module_to_component(${package} "3DQuickScene2D" "qt3d")
byd__package__set_module_to_component(${package} "3DRender" "qt3d")
byd__package__set_module_to_component(${package} "AccessibilitySupport" "qtbase")
byd__package__set_module_to_component(${package} "AndroidBearer" "qtbase")
byd__package__set_module_to_component(${package} "AndroidBluetooth" "qtconnectivity")
byd__package__set_module_to_component(${package} "AndroidExtras" "qtandroidextras")
byd__package__set_module_to_component(${package} "AndroidGamepad" "qtgamepad")
byd__package__set_module_to_component(${package} "Android" "qtbase")
byd__package__set_module_to_component(${package} "AndroidWebView" "qtwebview")
byd__package__set_module_to_component(${package} "AxContainer" "qtactiveqt")
byd__package__set_module_to_component(${package} "AxServer" "qtactiveqt")
byd__package__set_module_to_component(${package} "Bluetooth" "qtconnectivity")
byd__package__set_module_to_component(${package} "BootstrapDBus" "qtbase")
byd__package__set_module_to_component(${package} "Bootstrap" "qtbase")
byd__package__set_module_to_component(${package} "Charts" "qtcharts")
byd__package__set_module_to_component(${package} "ClipboardSupport" "qtbase")
byd__package__set_module_to_component(${package} "Concurrent" "qtbase")
byd__package__set_module_to_component(${package} "Core" "qtbase")
byd__package__set_module_to_component(${package} "DataVisualization" "qtdatavis3d")
byd__package__set_module_to_component(${package} "DBus" "qtbase")
byd__package__set_module_to_component(${package} "DesignerComponents" "qttools")
byd__package__set_module_to_component(${package} "Designer" "qttools")
byd__package__set_module_to_component(${package} "DeviceDiscoverySupport" "qtbase")
byd__package__set_module_to_component(${package} "EdidSupport" "qtbase")
byd__package__set_module_to_component(${package} "EglFSDeviceIntegration" "qtbase")
byd__package__set_module_to_component(${package} "EglFsKmsSupport" "qtbase")
byd__package__set_module_to_component(${package} "EglSupport" "qtbase")
byd__package__set_module_to_component(${package} "EventDispatcherSupport" "qtbase")
byd__package__set_module_to_component(${package} "FbSupport" "qtbase")
byd__package__set_module_to_component(${package} "FontDatabaseSupport" "qtbase")
byd__package__set_module_to_component(${package} "Gamepad" "qtgamepad")
byd__package__set_module_to_component(${package} "GlxSupport" "qtbase")
byd__package__set_module_to_component(${package} "GraphicsSupport" "qtbase")
byd__package__set_module_to_component(${package} "Gui" "qtbase")
byd__package__set_module_to_component(${package} "Help" "qttools")
byd__package__set_module_to_component(${package} "InputSupport" "qtbase")
byd__package__set_module_to_component(${package} "KmsSupport" "qtbase")
byd__package__set_module_to_component(${package} "LinguistTools" qttools)
byd__package__set_module_to_component(${package} "LinuxAccessibilitySupport" "qtbase")
byd__package__set_module_to_component(${package} "Location" "qtlocation")
byd__package__set_module_to_component(${package} "MacExtras" "qtmacextras")
byd__package__set_module_to_component(${package} "MultimediaGstTools" "qtmultimedia")
byd__package__set_module_to_component(${package} "Multimedia" "qtmultimedia")
byd__package__set_module_to_component(${package} "MultimediaQuick" "qtmultimedia")
byd__package__set_module_to_component(${package} "MultimediaWidgets" "qtmultimedia")
byd__package__set_module_to_component(${package} "NetworkAuth" "qtnetworkauth")
byd__package__set_module_to_component(${package} "Network" "qtbase")
byd__package__set_module_to_component(${package} "Nfc" "qtconnectivity")
byd__package__set_module_to_component(${package} "OpenGLExtensions" "qtbase")
byd__package__set_module_to_component(${package} "OpenGL" "qtbase")
byd__package__set_module_to_component(${package} "PacketProtocol" "qtdeclarative")
byd__package__set_module_to_component(${package} "PlatformCompositorSupport" "qtbase")
byd__package__set_module_to_component(${package} "Positioning" "qtlocation")
byd__package__set_module_to_component(${package} "PrintSupport" "qtbase")
byd__package__set_module_to_component(${package} "Purchasing" "qtpurchasing")
byd__package__set_module_to_component(${package} "QmlDebug" "qtdeclarative")
byd__package__set_module_to_component(${package} "QmlDevTools" "qtdeclarative")
byd__package__set_module_to_component(${package} "Qml" "qtdeclarative")
byd__package__set_module_to_component(${package} "QuickControls2" "qtquickcontrols2")
byd__package__set_module_to_component(${package} "QuickParticles" "qtdeclarative")
byd__package__set_module_to_component(${package} "Quick" "qtdeclarative")
byd__package__set_module_to_component(${package} "QuickTemplates2" "qtquickcontrols2")
byd__package__set_module_to_component(${package} "QuickTest" "qtdeclarative")
byd__package__set_module_to_component(${package} "QuickWidgets" "qtdeclarative")
byd__package__set_module_to_component(${package} "RemoteObjects" "qtremoteobjects")
byd__package__set_module_to_component(${package} "RepParser" "qtremoteobjects")
byd__package__set_module_to_component(${package} "Script" "qtscript")
byd__package__set_module_to_component(${package} "ScriptTools" "qtscript")
byd__package__set_module_to_component(${package} "Scxml" "qtscxml")
byd__package__set_module_to_component(${package} "Sensors" "qtsensors")
byd__package__set_module_to_component(${package} "SerialBus" "qtserialbus")
byd__package__set_module_to_component(${package} "SerialPort" "qtserialport")
byd__package__set_module_to_component(${package} "ServiceSupport" "qtbase")
byd__package__set_module_to_component(${package} "Sql" "qtbase")
byd__package__set_module_to_component(${package} "Svg" "qtsvg")
byd__package__set_module_to_component(${package} "Test" "qtbase")
byd__package__set_module_to_component(${package} "TextToSpeech" "qtspeech")
byd__package__set_module_to_component(${package} "ThemeSupport" "qtbase")
byd__package__set_module_to_component(${package} "UiPlugin" "qttools")
byd__package__set_module_to_component(${package} "UiTools" "qttools")
byd__package__set_module_to_component(${package} "VulkanSupport" "qtbase")
byd__package__set_module_to_component(${package} "WaylandClient" "qtwayland")
byd__package__set_module_to_component(${package} "WaylandCompositor" "qtwayland")
byd__package__set_module_to_component(${package} "WebChannel" "qtwebchannel")
byd__package__set_module_to_component(${package} "WebEngineCore" "qtwebengine")
byd__package__set_module_to_component(${package} "WebEngine" "qtwebengine")
byd__package__set_module_to_component(${package} "WebEngineWidgets" "qtwebengine")
byd__package__set_module_to_component(${package} "WebSockets" "qtwebsockets")
byd__package__set_module_to_component(${package} "WebView" "qtwebview")
byd__package__set_module_to_component(${package} "Widgets" "qtbase")
byd__package__set_module_to_component(${package} "WinExtras" "qtwinextras")
byd__package__set_module_to_component(${package} "X11Extras" "qtx11extras")
byd__package__set_module_to_component(${package} "XcbQpa" "qtbase")
byd__package__set_module_to_component(${package} "XmlPatterns" "qtxmlpatterns")
byd__package__set_module_to_component(${package} "Xml" "qtbase")
byd__package__set_module_to_component(${package} "Zlib" "qtbase")

# hint to generate:
# in source directory
# egrep -e 'TARGET[[:space:]]+=[[:space:]]+Qt' $(find . -iname '*.pro' | cut -d':' -f1 | xargs) | cut -d"/" -f 2 | sort | uniq
# egrep -e 'TARGET[[:space:]]+=[[:space:]]+Qt' $(find . -iname '*.pro' | cut -d':' -f1 | xargs) | sed 's/\.\/\([^/]*\).*:TARGET[[:space:]]*=[[:space:]]*Qt\(.*\)/byd__package__set_module_to_component(${package} "\2" "\1")/' | sort | uniq
#
# Sql missing
#
# missing
# byd__package__set_module_to_component(${package} "LinguistTools" qttools)
