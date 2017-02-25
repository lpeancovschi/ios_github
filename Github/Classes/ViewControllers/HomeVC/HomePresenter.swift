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
        self.homeView?.showLoading(withMessage: nil)
        self.homeInteractor.fetchRepositories(success: { (repositories) in
            self.homeView?.show(repositories: repositories)
            self.homeView?.hideLoading()
        }) { (error) in
            self.homeView?.hideLoading()
            self.homeView?.showError(error: error)
        }
    }
}
