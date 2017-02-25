import UIKit
import SwiftyJSON

class JsonReader: NSObject {
    class func readJson(named fileName: String) -> JSON {
        guard let path = Bundle(for: JsonReader.self).path(forResource: fileName, ofType: "json"), let json = try? String(contentsOfFile: path) else {
            return JSON(parseJSON: "")
        }
        
        return JSON(parseJSON: json)
    }
}
