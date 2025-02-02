import SwiftUI
import ActivityIndicatorView

struct PlacesView: View {
    // MARK: PROPERTIES
    @EnvironmentObject private var coordinator: Coordinator
    let model = PlacesViewModel()

    // MARK: BODY
    var body: some View {
        NavigationStack {
            Group {
                if model.placesAreFetched {
                    List(model.places, id: \.attributes.ogcFid) { place in
                        NavigationLink {
                            coordinator.placeDetailScene(with: place)
                        } label: {
                            PlacesRow(place: place)
                        }
                    }
                    .animation(.default, value: model.places)
                    .listStyle(.plain)
                } else {
                    VStack {
                        ActivityIndicatorView(isVisible: .constant(true), type: .arcs(count: 3, lineWidth: 1.5))
                            .foregroundColor(Color.theme.accent)
                            .frame(width: 150, height: 150)
                    }
                }
            }
            .navigationTitle("Kultůrmapa")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await model.fetchData()
        }
    }
}

// MARK: PREVIEW
struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
            .environmentObject(PlacesObservableObject(service: ProductionPlacesService()))
            .environmentObject(Coordinator())
    }
}
