import Foundation

struct Place: Decodable, Equatable, Identifiable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.attributes.ogcFid == rhs.attributes.ogcFid
    }
    
    var id = UUID()
    let geometry: Point
    let attributes: Properties
    
}
