import MapKit
import SwiftUI

struct PlacesMapView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = PlacesViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                mapViewWithPinOfKind(model.selectedKind)
                VStack {
                    VStack {
                        SearchBarView(searchText: model.$searchQuery)
                        CustomNavigationToolbarWithPlaceType(selectedKind: model.$selectedKind)
                    }
                    .backgroundStyle()
                    Spacer()
                }
            }
        }
        .task {
            await model.fetchData()
        }
        .sheet(item: model.$selectedPlace) { place in
            coordinator.placeDetailScene(with: place)
        }
    }
}

// MARK: - EXTENSION
extension PlacesMapView {
    private func mapViewWithPinOfKind(_ kind: String) -> some View {
        Map(coordinateRegion: model.$region,
            showsUserLocation: true,
            annotationItems: model.filterPlaces(by: kind)) { place in
                MapAnnotation(
                    coordinate: CLLocationCoordinate2D(
                        latitude: CLLocationDegrees(place.geometry?.latitude ?? 0.0),
                        longitude: CLLocationDegrees(place.geometry?.longitude ?? 0.0))) {
                            PlaceKindSymbol(symbol: place.symbol)
                                .scaleEffect(model.selectedPlace == place ? 1 : 0.7)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        model.selectedPlace = place
                                    }
                                }
                }
        }
        .ignoresSafeArea(edges: .top)
    }
}
