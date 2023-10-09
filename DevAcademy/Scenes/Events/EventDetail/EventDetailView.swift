import SwiftUI

struct EventDetailView: View {
    // MARK: PROPERTIES
    let model: EventDetailViewModel

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 15) {
                    Text(model.event.attributes.categories ?? "-")
                    Text(model.event.attributes.name)
                    Text(model.event.attributes.email ?? "")
                    Text(model.event.attributes.tickets ?? "no ticket")
                    Text(model.event.attributes.ticketsInfo ?? "no ticket info")
                    Text(model.event.attributes.ticketsUrl ?? "no ticket url")
                    VStack {
                        Text("\(model.event.attributes.dateFrom)")
                        Text("\(model.event.attributes.dateTo)")
                    }
                    VStack {
                        Text("\(model.event.geometry?.latitude ?? 0.0)")
                        Text("\(model.event.geometry?.longitude ?? 0.0)")
                    }
                    Text(model.event.attributes.text ?? "")
                }
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    EventDetailView(model: EventDetailViewModel(event: Events.mock.events[10]))
}
