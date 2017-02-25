import UIKit
import SwiftyJSON

struct Repository {
    let id: Int
    let name: String
    let fullName: String
    let owner: Owner
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.fullName = json["full_name"].stringValue
        self.owner = Owner(json: json["owner"])
    }
}
