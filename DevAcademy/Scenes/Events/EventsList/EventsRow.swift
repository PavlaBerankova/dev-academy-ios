import SwiftUI

struct EventsRow: View {
    // MARK: PROPERTIES
    let event: Event

    // MARK: - BODY
    var body: some View {
        HStack {
            eventImage
            eventTitleWithCategory
        }
    }
}

// MARK: - EXTENSION
extension EventsRow {
    private var eventImage: some View {
        Group {
            if let imageUrl = event.attributes.image {
                StoredAsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 4)
                } placeholder: {
                    // image is available, but loading
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color.theme.ink)
                        .frame(width: 60, height: 60)
                        .shadow(color: Color.theme.shadow, radius: 2, x: 3, y: 3)
                        .overlay(
                            ProgressView())
                }
            } else { // placeholder: image is missing
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.theme.accent)
                    .frame(width: 60, height: 60)
                    .shadow(color: Color.theme.shadow, radius: 2, x: 3, y: 3)
                    .overlay(
                        Image.otherSymbol.imagePlaceholder
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.theme.ink)
                            .padding(.horizontal, 6))
            }
        }
    }

    private var eventTitleWithCategory: some View {
        VStack(alignment: .leading) {
            Text(event.attributes.name)
                .font(.title3)
                .fontWeight(.semibold)
                .lineLimit(4)

            Text(event.attributes.categories ?? "")
                .font(.footnote)
                .opacity(0.7)
                .lineLimit(2)
        }
    }
}

// MARK: - PREVIEW
#Preview {
    EventsRow(event: Events.mock.events[10])
}
