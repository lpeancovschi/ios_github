import UIKit
import SwiftyJSON

struct Owner {
    let login: String
    let id: Int
    let avatarUrl: URL?
    let url: URL?
    
    init(json: JSON) {
        self.login = json["login"].stringValue
        self.id = json["id"].intValue
        self.avatarUrl = URL(string: json["avatar_url"].stringValue)
        self.url = URL(string: json["url"].stringValue)
    }
}
