import Foundation

struct EventPoint {
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case latitude = "y"
        case longitude = "x"
    }
}
