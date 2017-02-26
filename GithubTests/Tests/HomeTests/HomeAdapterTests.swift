import XCTest
import SwiftyJSON
@testable import Github

class HomeAdapterTests: XCTestCase {

    func testHomeAdapter() {
        var repositories = [Repository]()
        
        let repositoriesJson = JsonReader.readJson(named: "Repositories")
        for repoJson in repositoriesJson.arrayValue {
            repositories.append(Repository(json: repoJson))
        }
        
        // given a home adapter
        let mockTableView = MockTableView()
        let homeAdapter = HomeAdapter(tableView: mockTableView)
        
        // when data source is set
        homeAdapter.dataSource = repositories
        
        // then table view reloadData() method is called
        XCTAssert(mockTableView.reloadDataCallCount == 1, "reloadData() should've been called on tableView")
        
        let rowCount = homeAdapter.tableView(mockTableView, numberOfRowsInSection: 0)
        XCTAssert(rowCount == 2, "Home adapter should have 2 repositories")
    }
}
