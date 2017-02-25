import UIKit

class HomeAdapter: NSObject {
    fileprivate let tableView: UITableView
    var dataSource = [Repository]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        self.registerCells()
    }
}

fileprivate extension HomeAdapter {
    // MARK: Setup Methods
    
    func registerCells() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }
}

extension HomeAdapter: UITableViewDataSource {
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = self.dataSource[indexPath.row].name
        
        return cell
    }
}
