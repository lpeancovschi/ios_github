import UIKit
import SVProgressHUD

protocol BaseView: class {
    func showLoading(withMessage text: String?)
    func hideLoading()
    func showError(error: Error)
}

extension UIViewController: BaseView {
    func showLoading(withMessage text: String?) {
        guard let text = text else {
            SVProgressHUD.show()
            return
        }
        
        SVProgressHUD.show(withStatus: text)
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showError(error: Error) {
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
