import MapKit
import SwiftUI

struct EventsMapView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = EventsViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                mapViewWithPin
            }
        }
        .task {
            await model.fetchEventsData()
        }
//        .sheet(item: model.$selectedPlace) { place in
//            coordinator.placeDetailScene(with: place)
//        }
    }
}

// MARK: - EXTENSION
extension EventsMapView {
    private var mapViewWithPin: some View {
        Map(coordinateRegion: model.$region,
            showsUserLocation: true,
            annotationItems: model.events) { event in
                MapAnnotation(
                    coordinate: CLLocationCoordinate2D(latitude: event.geometry?.latitude ?? 0.0, longitude: event.geometry?.longitude ?? 0.0)) {
                            SymbolByPlaceKind(symbol: Image(systemName: "mappin.circle.fill"))
//                                .scaleEffect(model.selectedPlace == place ? 1 : 0.7)
//                                .onTapGesture {
//                                    withAnimation(.easeInOut) {
//                                        model.selectedPlace = place
//                                    }
//                                }
                }
        }
        .ignoresSafeArea(edges: .top)
    }
}

// MARK: - PREVIEW

#Preview {
    EventsMapView()
        .environmentObject(EventsObservableObject(eventsService: MockEventsService()))
        .environmentObject(Coordinator())
}
