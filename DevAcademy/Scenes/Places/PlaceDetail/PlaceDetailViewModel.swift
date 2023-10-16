import MapKit
import SwiftUI

struct PlaceDetailViewModel: DynamicProperty {
    // MARK: PROPERTIES
    @EnvironmentObject private var placesObservableObject: PlacesObservableObject

    var place: Place

    init(place: Place) {
        self.place = place
    }

    var isFavourite: Binding<Bool> {
        .init {
            placesObservableObject.favouritePlaces?.contains(place.attributes.ogcFid) ?? false
        } set: { newValue in
            placesObservableObject.set(place: place, favourite: newValue)
        }
    }

    // MARK: - PLACE MAIN INFORMATION
    // IMAGE
    var placeImage: URL? {
        place.attributes.imageURL
    }

    // TITLE
    var placeName: String {
        place.attributes.title
    }

    // ADDRESS
    var placeAddress: String {
        (place.attributes.street ?? "") + " " + (place.attributes.streetNo ?? "")
    }

    // MARK: - PLACE LINKS
    // WEB
    var placeWeb: String {
        if let placeWeb = place.attributes.web {
            return placeWeb.checkAndFixHasprefix()
        }
        return "-"
    }

    var webPlaceholder: String {
        placeWeb.simpleStringFromUrl()
    }

    // PHONE
    var placePhone: String { // place phone return "123456789", "0", "-"
        place.attributes.phone?.filteringWhiteSpace() ?? "-"
    }

    var phonePlaceholder: String {
        formatPhoneNumber(placePhone)
    }

    // EMAIL
    var placeEmail: String {
        place.attributes.email?.filteringWhiteSpace() ?? "-"
    }

    // PROGRAMME
    var placeProgramme: String {
        if let placeProgramme = place.attributes.programme {
            return placeProgramme.checkAndFixHasprefix()
        }
        return "-"
    }

    var programmeIsAvailable: Bool {
        guard place.attributes.programme != nil else {
            return false
        }
        return true
    }

    // MARK: - PLACE AND USER COORDINATE
    var currentPlaceCoordinate: CLLocation {
        let placeLatitude: Double = place.geometry?.latitude ?? 0.0
        let placeLongitude: Double = place.geometry?.longitude ?? 0.0
        return CLLocation(latitude: placeLatitude, longitude: placeLongitude)
    }

    // MARK: - FUNCTIONS
    func getDistance() -> String {
        if let userLocation = placesObservableObject.lastUpdatedLocation {
            return Int(currentPlaceCoordinate.distance(from: userLocation)).convertDistance()
        }
        return "-"
    }

    func openAppleMaps() {
        let coordinates = CLLocationCoordinate2D(latitude: place.geometry?.latitude ?? 0.0, longitude: place.geometry?.longitude ?? 0.0)
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.phoneNumber = placePhone
        mapItem.url = URL(string: placeWeb)
        mapItem.openInMaps(launchOptions: nil)
    }

    private func formatPhoneNumber(_ number: String) -> String {
        if number == "0" || number == "-" {
            return "-"
        } else {
            let numberToInt = Int(number)
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.groupingSeparator = " " // --> 123 456 789
            let formattedNumber = numberFormatter.string(from: NSNumber(value: numberToInt!)) ?? "-"
            return formattedNumber
        }
    }
}
