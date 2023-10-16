import SwiftUI

struct EventDetailViewModel: DynamicProperty {
    // MARK: PROPERTIES
    @EnvironmentObject private var eventsObservableObject: EventsObservableObject
    var event: Event

    init(event: Event) {
        self.event = event
    }

    // MARK: - EVENT ATTRIBUTES
    // IMAGE
    var eventImage: URL? {
        event.attributes.image
    }

    // NAME
    var eventName: String {
        event.attributes.name
    }

    // CATEGORY
    var eventCategory: String {
        event.attributes.categories ?? ""
    }

    // DATE
    var eventDateFrom: String {
        event.attributes.dateFrom.dateFormat()
    }

    var eventDateTo: String {
        event.attributes.dateTo.dateFormat()
    }

    // TICKETS
    var eventTickets: String {
        event.attributes.tickets ?? ""
    }

    var eventTicketsInfo: String {
        event.attributes.ticketsInfo ?? ""
    }

    var eventTicketWeb: String {
        if let eventTicketWeb = event.attributes.ticketsUrl {
            return eventTicketWeb.checkAndFixHasprefix()
        }
        return ""
    }

    var eventTicketWebPlaceholder: String {
        eventTicketWeb.simpleStringFromUrl()
    }

    // EMAIL
    var eventEmail: String {
        event.attributes.email?.filteringWhiteSpace() ?? ""
    }

    // WEB
    var eventWeb: String {
        if let eventWeb = event.attributes.url {
            return eventWeb.checkAndFixHasprefix()
        } else {
            return ""
        }
    }

    var eventWebPlaceholder: String {
        eventWeb.simpleStringFromUrl()
    }
    // NOTES
    var eventNotes: String {
        if let eventNotes = event.attributes.text {
            return eventNotes
        }
        return ""
    }
}
