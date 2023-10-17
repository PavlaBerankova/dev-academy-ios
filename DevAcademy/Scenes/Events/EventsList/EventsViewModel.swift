import SwiftUI

struct EventsViewModel: DynamicProperty {
    @EnvironmentObject private var eventsObservableObject: EventsObservableObject

    var events: [Event] {
        eventsObservableObject.events
    }

    func fetchEventsData() async {
        await eventsObservableObject.fetchEventsData()
    }
}
