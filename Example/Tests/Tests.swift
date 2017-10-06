import UIKit
import XCTest
import LocusPocus

class Tests: XCTestCase {
    
    func testBasic() {
        //given
        let testKey = "test.example"
        let bundle = Bundle(for: Tests.self)
        
        //when
        let stringWithKey = testKey.localized(tableName: nil, bundle: bundle, value: "", comment: nil)
        let nsLocalizedStringVersion = NSLocalizedString(testKey, tableName: nil, bundle: bundle, value: "", comment: "")
        
        //then
        let shouldBeEqual = stringWithKey == nsLocalizedStringVersion
        XCTAssert(shouldBeEqual, "Pass")
    }
    
    func testIncorrectKey() {
        //given
        let testKey = "clearly-incorrect-key"
        let bundle = Bundle(for: Tests.self)
        
        //when
        let stringWithKey = testKey.localized(tableName: nil, bundle: bundle, value: "", comment: nil)
        let nsLocalizedStringVersion = NSLocalizedString(testKey, tableName: nil, bundle: bundle, value: "", comment: "")
        
        //then
        let shouldBeEqual = stringWithKey == nsLocalizedStringVersion
        XCTAssert(shouldBeEqual, "Pass")
    }
}
