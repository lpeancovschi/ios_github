import UIKit
import Alamofire
import SwiftyJSON

fileprivate let BaseURL = "https://api.github.com/"

class NetworkingClient: Networking {
    
    func send(path: String, method: HTTPMethod, params: [String: String], success: @escaping SuccessHandler, failure: @escaping ErrorHandler) {
        Alamofire
            .request(BaseURL + path, method: method, parameters: params)
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    success(JSON(data))
                case .failure(let error):
                    failure(error)
                }
            }
    }
}
