import XCTest
import SwiftyJSON
@testable import Github

class HomeInteractorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testHomeInteractorWithValidJson() {
        let repositoriesJson = JsonReader.readJson(named: "Repositories")
        let fakeNetworking = FakeNetworking(json: repositoriesJson)
        let homeInteractor = HomeInteractor(networkClient: fakeNetworking)
        
        homeInteractor.fetchRepositories(success: { (repositories) in
            XCTAssert(repositories.count == 2, "Home interactor should return 2 repos")
        }) { (error) in
            XCTAssert(false, "Failure block shouldn't be called when parsing a valid json")
        }
    }
    
    func testHomeInteractorWithError() {
        let error = NSError(domain: "custom", code: 400, userInfo: [:])
        let fakeNetworking = FakeNetworking(error: error)
        let homeInteractor = HomeInteractor(networkClient: fakeNetworking)
        
        homeInteractor.fetchRepositories(success: { (repositories) in
            XCTAssert(false, "Success block shouldn't be called when getting an error")
        }) { (error) in
            XCTAssert(true, "Failure block should be called on error")
        }
    }
}
