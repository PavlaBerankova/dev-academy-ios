import SwiftUI

class MockEventsService: EventsService {
    func fetchEvents() async throws -> Events {
        Events.mock
    }
}

protocol EventsService {
    func fetchEvents() async throws -> Events
}
