import UIKit

class MockTableView: UITableView {
    var reloadDataCallCount = 0
    
    override func reloadData() {
        super.reloadData()
        self.reloadDataCallCount += 1
    }
}
