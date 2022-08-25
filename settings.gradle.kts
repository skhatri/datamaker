rootProject.name="datamaker"

listOf("core").forEach { folder ->
    include(folder)
    project(":${folder}").projectDir = file(folder)
}
