import UIKit
@testable import Github

class HomeViewMock: HomeView {
    var didShowError = false
    var didShowRepositories = false
    var loadingSequence: [Bool] = [Bool]()
    
    func showError(error: Error) {
        self.didShowError = true
    }
    
    func show(repositories: [Repository]) {
        self.didShowRepositories = true
    }
    
    func showLoading(withMessage text: String?) {
        self.loadingSequence.append(true)
    }
    
    func hideLoading() {
        self.loadingSequence.append(false)
    }
}
