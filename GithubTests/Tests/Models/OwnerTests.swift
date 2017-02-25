import XCTest
import SwiftyJSON
@testable import Github

class OwnerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testOwnerWithFullJson() {
        let owner = Owner(json: JsonReader.readJson(named: "Owner"))
        
        XCTAssert(owner.login == "lpeancovschi", "Owner should equal 'lpeancovschi'")
        XCTAssert(owner.id == 4647638, "Owner id should be 4647638")
        XCTAssert(owner.avatarUrl?.absoluteString == "https://avatars.githubusercontent.com/u/4647638?v=3", "Wrong avatar url")
        XCTAssert(owner.url?.absoluteString == "https://api.github.com/users/lpeancovschi", "Wrong owner url")
    }
    
    func testOwnerWithEmptyJSON() {
        let owner = Owner(json: JSON(parseJSON: ""))
        
        XCTAssert(owner.login == "", "Owner should be empty")
        XCTAssert(owner.id == 0, "Owner id should be 0")
        XCTAssert(owner.avatarUrl == nil, "Avatar url should be nil")
        XCTAssert(owner.url == nil, "Url should be nil")
    }
}
