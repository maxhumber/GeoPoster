import Foundation
import CoreLocation

struct GeoPosterPayload: Codable {
    var lat: Double
    var lon: Double
    var time: Int64
    var ext: String
    
    init(_ location: CLLocationCoordinate2D, time: Date, ext: String?) {
        self.lat = location.latitude
        self.lon = location.longitude
        self.time = time.epochTimestamp
        self.ext = ext ?? ""
    }
}
