import SwiftyJSON
import Alamofire
@testable import Github

class FakeNetworking: Networking {
    fileprivate var responseJson: JSON? = nil
    fileprivate var error: Error? = nil
    
    init(json: JSON) {
        self.responseJson = json
    }
    
    init(error: Error) {
        self.error = error
    }
    
    func send(path: String, method: HTTPMethod, params: [String : String], success: @escaping SuccessHandler, failure: @escaping ErrorHandler) {
        if let responseJson = self.responseJson {
            success(responseJson)
        } else if let error = self.error {
            failure(error)
        }
    }
}
