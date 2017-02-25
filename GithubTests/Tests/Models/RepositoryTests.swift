import XCTest
import SwiftyJSON
@testable import Github

class RepositoryTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testOwnerWithFullJson() {
        let repository = Repository(json: JsonReader.readJson(named: "Repository"))
        
        XCTAssert(repository.id == 11860407, "Repo id should be 4647638")
        XCTAssert(repository.name == "blog", "Repo name should be blog")
        XCTAssert(repository.fullName == "lpeancovschi/blog", "Repo name should not be empty")
        XCTAssert(repository.owner.id == 4647638, "Repo owner id should be 4647638")
    }
    
    func testOwnerWithEmptyJSON() {
        let repository = Repository(json: JSON(parseJSON: ""))
        
        XCTAssert(repository.id == 0, "Repo id parsing'")
        XCTAssert(repository.name == "", "Repo name parsing")
        XCTAssert(repository.fullName == "", "Repo name should be empty")
        XCTAssert(repository.owner.id == 0, "Repo owner id should be 0")
    }
}
