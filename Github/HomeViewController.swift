import UIKit

protocol HomeView: BaseView {
    func show(repositories: [Repository])
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var homeAdapter: HomeAdapter!
    fileprivate var homePresenter: HomePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupAdapter()
        self.setupPresenter()
        
        self.homePresenter.fetchRepositories()
    }
}

fileprivate extension HomeViewController {
    // MARK: Setup Methods
    
    func setupAdapter() {
        self.homeAdapter = HomeAdapter(tableView: self.tableView)
        self.tableView.dataSource = self.homeAdapter
    }
    
    func setupPresenter() {
        let homeInteractor = HomeInteractor(networkClient: NetworkingClient())
        self.homePresenter = HomePresenter(homeInteractor: homeInteractor, homeView: self)
    }
}

extension HomeViewController: HomeView {
    // MARK: HomeView Protocol
    
    func show(repositories: [Repository]) {
        self.homeAdapter.dataSource = repositories
    }
}
