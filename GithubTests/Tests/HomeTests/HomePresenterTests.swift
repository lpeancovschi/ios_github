import XCTest
import SwiftyJSON
@testable import Github

class HomePresenterTests: XCTestCase {
    
    func testPresenterOnSuccess() {
        let homeView = HomeViewMock()
        
        let repositoriesJson = JsonReader.readJson(named: "Repositories")
        let fakeNetworking = FakeNetworking(json: repositoriesJson)
        let homeInteractor = HomeInteractor(networkClient: fakeNetworking)
        
        // given a home presenter
        let homePresenter = HomePresenter(homeInteractor: homeInteractor, homeView: homeView)
        
        // when repositories are fetched
        homePresenter.fetchRepositories()
        
        // then loading is shown and then hidden
        XCTAssert(homeView.loadingSequence == [true, false], "Loading should be shown then hidden")
        // home view shows repos
        XCTAssert(homeView.didShowRepositories == true, "Home View should show repos")
        // home view doesn't show any error
        XCTAssert(homeView.didShowError == false, "Home View should not show any error")
    }
    
    func testPresenterOnError() {
        let homeView = HomeViewMock()
        
        let error = NSError(domain: "custom", code: 400, userInfo: [:])
        let fakeNetworking = FakeNetworking(error: error)
        let homeInteractor = HomeInteractor(networkClient: fakeNetworking)
        
        // given a home presenter
        let homePresenter = HomePresenter(homeInteractor: homeInteractor, homeView: homeView)
        
        // when repositories are fetched
        homePresenter.fetchRepositories()
        
        // then loading is shown and then hidden
        XCTAssert(homeView.loadingSequence == [true, false], "Loading should be shown then hidden")
        // home view shows an error
        XCTAssert(homeView.didShowError == true, "Home View should show the error")
        // home view doesn't show any repos
        XCTAssert(homeView.didShowRepositories == false, "Home View should not show repos")
    }
}
