import SwiftUI

struct PlaceDetailViewModel: DynamicProperty {
    
    @EnvironmentObject private var placesObservableObject: PlacesObservableObject
    @State var isTappedFavorite = false
    
    var place: Place
    init(place: Place) {
        self.place = place
    }
    
    var placeName: String {
        place.attributes.title
    }
    
    var placeImage: URL {
        place.attributes.imageURL!
    }
    
    var placeEmail: String? {
        place.attributes.email
    }
    
    var placeKind: String {
        place.attributes.kind.rawValue
    }
    
    
    func addFavorites() {
        isTappedFavorite.toggle()
    }
}

