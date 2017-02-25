import UIKit

typealias HomeInteractorSuccessHandler = ([Repository]) -> ()
typealias HomeInteractorFailureHandler = (Error) -> ()

protocol HomeInteractorProtocol {
    func fetchRepositories(success: @escaping HomeInteractorSuccessHandler, failure: @escaping HomeInteractorFailureHandler)
}

class HomeInteractor: HomeInteractorProtocol {
    fileprivate let networkClient: Networking
    
    init(networkClient: Networking) {
        self.networkClient = networkClient
    }
    
    func fetchRepositories(success: @escaping HomeInteractorSuccessHandler, failure: @escaping HomeInteractorFailureHandler) {
        self.networkClient.send(path: "users/lpeancovschi/repos", method: .get, params: [:], success: { (json) in
            var reposiroeies = [Repository]()
            for repoJson in json.arrayValue {
                reposiroeies.append(Repository(json: repoJson))
            }
            
            success(reposiroeies)
        }) { (error) in
            failure(error)
        }
    }
}
