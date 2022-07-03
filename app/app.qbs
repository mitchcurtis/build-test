import qbs
import qbs.FileInfo

QtGuiApplication {
    name: "app"
    targetName: "app"
    consoleApplication: false

    Depends {
        name: "Qt"
        submodules: ["core"]
        versionAtLeast: "5.12"
    }
    Depends { name: "libfoo" }

    // Additional import path used to resolve QML modules in Qt Creator's code model
    property pathList qmlImportPaths: []

    readonly property bool darwin: qbs.targetOS.contains("darwin")
    readonly property bool windows: qbs.targetOS.contains("windows")

    readonly property string installRootDir: FileInfo.cleanPath(buildDirectory + "/../install-root")
    readonly property string finalInstallDir: installRootDir + (windows ? "" : "/usr/local")

    cpp.useRPaths: darwin
    // Ensure that e.g. libslate is found.
    cpp.rpaths: darwin ? ["@loader_path/../../../Library/Frameworks"] : ["$ORIGIN/lib"]

    cpp.cxxLanguageVersion: "c++17"
    // https://bugreports.qt.io/browse/QBS-1434
    cpp.minimumMacosVersion: "10.13"


    cpp.defines: {
        var defines = [
            // The following define makes your compiler emit warnings if you use
            // any feature of Qt which as been marked deprecated (the exact warnings
            // depend on your compiler). Please consult the documentation of the
            // deprecated API in order to know how to port your code away from it.
            "QT_DEPRECATED_WARNINGS",

            // You can also make your code fail to compile if you use deprecated APIs.
            // In order to do so, uncomment the following line.
            // You can also select to disable deprecated APIs only up to a certain version of Qt.
            //"QT_DISABLE_DEPRECATED_BEFORE=0x060000" // disables all the APIs deprecated before Qt 6.0.0
        ]

        return defines
    }

    files: [
        "Application.h",
        "Application.cpp",
        "main.cpp"
    ]

    Group {
        name: "Install (non-macOS)"
        condition: !qbs.targetOS.contains("macos")
        fileTagsFilter: product.type

        qbs.install: true
        qbs.installSourceBase: product.buildDirectory
    }

    // This is necessary to install the app bundle (OS X)
    Group {
        name: "bundle.content install"
        fileTagsFilter: ["bundle.content"]

        qbs.install: true
        qbs.installDir: "."
        qbs.installSourceBase: product.buildDirectory
    }
}
