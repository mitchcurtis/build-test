import qbs

Project {
    name: "build-test"

    references: [
        "app/app.qbs",
        "libs/libs.qbs",
    ]
}
