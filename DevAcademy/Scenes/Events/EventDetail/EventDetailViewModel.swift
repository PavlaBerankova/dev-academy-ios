import SwiftUI

struct EventDetailViewModel: DynamicProperty {
    // MARK: PROPERTIES
    @EnvironmentObject private var eventsObservableObject: EventsObservableObject

    var event: Event

    init(event: Event) {
        self.event = event
    }
}
