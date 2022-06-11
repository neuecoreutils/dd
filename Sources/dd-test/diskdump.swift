import Foundation
import ArgumentParser
import Progress

func getFileSize(_ f: String) -> Int64? {
    guard let attrs = try? FileManager.default.attributesOfItem(atPath: f) else {
        return nil
    }
    return attrs[.size] as? Int64
}
 
func diskdump(_ input: String, _ output: String) {
    let inputFile: FileHandle? = FileHandle(forReadingAtPath: input)
    if FileManager.default.fileExists(atPath: output) == false {
        if FileManager.default.createFile(atPath: output, contents: nil, attributes: nil) == false {
            print("Cannot create file.")
            exit(1)
        }
    }

    let outputFile: FileHandle? = FileHandle(forWritingAtPath: output)

    let inputData: Data? = inputFile?.readDataToEndOfFile()
    let outputData: [UInt8]? = inputData?.map { $0 }
    let size = getFileSize(input)

    do {
        // while ((try outputFile?.write(contentsOf: outputData!)) != nil) {}
        try outputFile?.write(contentsOf: outputData!)
        
        print("dumped \(input) to \(output) successfully.")
    } catch {
        print("Dump failed.")
        print(error)
    }

}
 
@main
struct dd: ParsableCommand {
    @Argument(help: "The input file.")
    var inf: String
    
    @Argument(help: "The output file.")
    var ouf: String

    mutating func run() throws {
        diskdump(inf, ouf)
    }
}