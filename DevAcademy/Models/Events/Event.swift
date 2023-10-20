import Foundation

struct Event: Identifiable {
    let attributes: EventAttributes
    let geometry: EventPoint?

    var id: Int {
        attributes.id
    }
}
