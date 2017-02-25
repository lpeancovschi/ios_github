import UIKit

protocol HomePresenterProtocol {
    func fetchRepositories()
}

class HomePresenter: HomePresenterProtocol {
    fileprivate let homeInteractor: HomeInteractorProtocol
    fileprivate weak var homeView: HomeView?
    
    init(homeInteractor: HomeInteractorProtocol, homeView: HomeView) {
        self.homeInteractor = homeInteractor
        self.homeView = homeView
    }
    
    func fetchRepositories() {
        self.homeInteractor.fetchRepositories(success: { (repositories) in
            self.homeView?.show(repositories: repositories)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
