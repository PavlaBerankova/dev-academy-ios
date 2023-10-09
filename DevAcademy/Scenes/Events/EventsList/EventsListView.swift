import SwiftUI

struct EventsListView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = EventsViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            Text("Akce")
            .navigationTitle("Akce")
        }
    }
}

#Preview {
    EventsListView()
        .environmentObject(EventsObservableObject(eventsService: MockEventsService()))
        .environmentObject(Coordinator())
}
