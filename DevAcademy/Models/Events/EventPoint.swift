import CoreLocation
import Foundation

struct EventPoint{
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "y"
        case longitude = "x"
    }

    var eventCoordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
}
