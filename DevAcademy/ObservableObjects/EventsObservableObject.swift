import Foundation

final class EventsObservableObject: ObservableObject {
    @Published var events: [Event] = []

    private let eventsService: EventsService

    init(eventsService: EventsService) {
        self.eventsService = eventsService
    }
}
