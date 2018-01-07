import Darwin
import PathKit
import xcproj

enum FileReference: String {
    case input = "Input"
    case output = "Output"

    var fullPath: String { return "Sources/BackpackBenchmark/Sample/\(rawValue)" }
    var type: FileType { return .folder }
    var file: PBXFileReference {
        return PBXFileReference(reference: "FLE\(rawValue)", sourceTree: .group,
                                name: rawValue, lastKnownFileType: type.type, path: fullPath)
    }
    var buildFile: PBXBuildFile {
        return PBXBuildFile(reference: "RF\(rawValue)", fileRef: file.reference)
    }
}

enum FileType: String {
    case folder

    var type: String { return rawValue }
}

do {
    guard CommandLine.arguments.count >= 3 else {
        print("Specify project path and target name where the build phase should be injected.")
        exit(1)
    }

    let projectPath = Path(CommandLine.arguments[1])
    let targetName = CommandLine.arguments[2]
    let project = try XcodeProj(path: projectPath)
    let files: [FileReference] = [.input, .output]

    let copySamplesPhase = PBXCopyFilesBuildPhase(reference: "CPYSMPLSRFRNC", dstPath: "", dstSubfolderSpec: .executables,
                                                  name: "Copy sample inputs", files: files.map { $0.buildFile.reference })

    guard
        let target = project.pbxproj.nativeTargets.filter({ $0.name == targetName }).first,
        let rootProject = project.pbxproj.projects.filter({ $0.reference == project.pbxproj.rootObject }).first,
        let mainGroup = project.pbxproj.groups.filter({ $0.reference == rootProject.mainGroup }).first
    else {
        print("Unexpected project structure.")
        exit(1)
    }

    project.pbxproj.copyFilesBuildPhases.append(copySamplesPhase)
    target.buildPhases.append(copySamplesPhase.reference)

    files.forEach { file in
        project.pbxproj.fileReferences.append(file.file)
        project.pbxproj.buildFiles.append(file.buildFile)
        mainGroup.children.append(file.file.reference)
    }

    try project.write(path: projectPath, override: true)

    print("Project updated.")
} catch {
    print(error)
    exit(1)
}
