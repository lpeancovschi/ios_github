import UIKit
import SwiftyJSON
import Alamofire

typealias SuccessHandler = (JSON) -> ()
typealias ErrorHandler = (Error) -> ()

protocol Networking {
    func send(path: String, method: HTTPMethod, params: [String: String], success: @escaping SuccessHandler, failure: @escaping ErrorHandler)
}
