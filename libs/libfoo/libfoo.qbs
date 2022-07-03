import qbs
import qbs.Environment
import qbs.FileInfo

Product {
    id: root
    name: "libfoo"
    targetName: "foo"
    type: Qt.core.staticBuild ? "staticlibrary" : "dynamiclibrary"

    Depends { name: "cpp" }
    Depends {
        name: "Qt"
        submodules: ["core"]
        versionAtLeast: "5.12"
    }
    // For version info.
    Depends { name: "vcs" }
    Depends { name: "bundle" }

    readonly property bool linux: qbs.targetPlatform === "linux"
    readonly property bool windows: qbs.targetOS.contains("windows")

    cpp.cxxLanguageVersion: "c++17"
    // Ignore "'*/' found outside of comment"
    cpp.commonCompilerFlags: windows ? "/wd4138" : ""
    // Necessary for fmod on newer Ubuntus: https://stackoverflow.com/a/59916438
    Properties {
        condition: linux
        cpp.linkerVariant: "gold"
    }
    cpp.includePaths: [
        // This seems to be necessary for Q_MOC_INCLUDE since Qt 6, but feels like it shouldn't be...
        path
    ]
    // https://bugreports.qt.io/browse/QBS-1434
    cpp.minimumMacosVersion: "10.13"
    cpp.visibility: "minimal"
    cpp.defines: [
        "FOO_LIBRARY"
    ]

    bundle.isBundle: false
    cpp.sonamePrefix: qbs.targetOS.contains("darwin") ? "@rpath" : undefined

    Export {
        Depends { name: "cpp" }
        Depends {
            name: "Qt"
            submodules: ["core"]
        }

        cpp.includePaths: [
            exportingProduct.sourceDirectory
        ]
        cpp.libraryPaths: root.cpp.libraryPaths
        cpp.rpaths: root.cpp.rpaths
    }

    Group {
        qbs.install: true
        qbs.installDir: {
            if (qbs.targetOS.contains("windows"))
                return ""
            else if (qbs.targetOS.contains("darwin"))
                return "Library/Frameworks"
            else
                return "lib"
        }
        fileTagsFilter: "dynamiclibrary"
    }

    files: [
        "AbstractApplication.cpp",
        "AbstractApplication.h"
    ]
}
