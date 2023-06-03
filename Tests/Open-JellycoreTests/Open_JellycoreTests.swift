import TreeSitter
import TreeSitterJelly

import XCTest
@testable import Open_Jellycore

final class Open_JellycoreTests: XCTestCase {
    var testString: String = """
    import Shortcuts
    #Icon: sailboat
    #Color: blue
    
    text(text: "Hello")
    """

    func testExample() throws {
        let parser = Parser(contents: testString)
        try parser.parse()
        
        let transpiler = Transpiler(parser: parser)
        let shortcut = try transpiler.compile()
        if !ErrorReporter.shared.errors.isEmpty {
            for error in ErrorReporter.shared.errors {
                print(error.errorDescription ?? "No Description", error.recoveryStrategy)
            }
            XCTFail("Found \(ErrorReporter.shared.errors.count) errors")
        } else {
            print("Successfully Compiled Shortcut")
            print(shortcut)
        }
    }
}
