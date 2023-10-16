import ActivityIndicatorView
import SwiftUI

struct PlaceDetailView: View {
    // MARK: PROPERTIES
    @Environment(\.dismiss)
    private var dismiss
    let model: PlaceDetailViewModel

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    placeImage
                    LazyVStack(alignment: .leading, spacing: 10) {
                        placeTitleWithAddressAndDistance
                        navigateButton
                        ScrollView {
                            placeLinks
                        }
                    }
                    .padding(.horizontal)
                }
                .ignoresSafeArea(edges: .top)
            }
            Spacer()
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    navigationToolbarBackButton
                    navigationToolbarFavoriteButton
                }
        }
    }
}

// MARK: - EXTENSION
extension PlaceDetailView {
    private var navigationToolbarBackButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                dismiss()
            } label: {
                ToolbarButtonView(title: "Back button", iconName: "chevron.left")
            }
        }
    }

    private var navigationToolbarFavoriteButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                model.isFavourite.wrappedValue.toggle()
            } label: {
                ToolbarButtonView(title: "Favorite button", iconName: model.isFavourite.wrappedValue ? "star.fill" : "star")
            }
        }
    }

    private var placeImage: some View {
        ImageView(imageURL: model.placeImage)
    }

    private var placeTitleWithAddressAndDistance: some View {
        VStack(alignment: .leading) {
            Text(model.placeName)
                .lineLimit(2)
                .font(.title3)
                .fontWeight(.bold)
            HStack {
                Text(model.placeAddress)
                    .lineLimit(2)
                    .opacity(0.7)
                Spacer()
                if model.getDistance() != "-" {
                    Image.otherSymbol.locationArrow
                        .foregroundColor(Color.theme.accent)
                    Text(model.getDistance())
                        .opacity(0.7)
                }
            }
        }
        .padding(.top, 15)
    }

    private var navigateButton: some View {
        Button {
            model.openAppleMaps()
        } label: {
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 1)
                .foregroundColor(Color.theme.accent)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(Color.theme.ink)
                .overlay(
                    HStack {
                        Image.otherSymbol.navigateArrow
                        Text("Navigovat")
                    }
                )
        }
        .padding(.vertical)
    }

    private var placeLinks: some View {
        VStack {
            PlaceInfoRow(header: "Web", link: model.placeWeb, linkPlaceholder: model.webPlaceholder)
            PlaceInfoRow(header: "Telefon", link: "tel://" + model.placePhone, linkPlaceholder: model.phonePlaceholder)
            PlaceInfoRow(header: "E-mail", link: "mailto:" + model.placeEmail, linkPlaceholder: model.placeEmail)
            if model.programmeIsAvailable {
                PlaceInfoRow(header: "Program", link: model.placeProgramme, linkPlaceholder: "přejít na program")
            }
        }
    }
}

// MARK: - PREVIEW
struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(model: PlaceDetailViewModel(place: Places.mock.places[0]))
            .environmentObject(PlacesObservableObject(
                placesService: ProductionPlacesService(),
                userLocationService: ProductionUserLocationService()))
    }
}
