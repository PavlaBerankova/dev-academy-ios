import SwiftUI

struct ToolbarButtonView: View {
    // MARK: PROPERTIES
    let iconName: String

    // MARK: BODY
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 40, height: 40)
            .background(
                Circle()
                    .foregroundColor(Color.theme.ink)
                    .opacity(0.7)
            )
    }
}

// MARK: PREVIEW
struct ToolbarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            ToolbarButtonView(iconName: "star")
        }
        .previewLayout(.sizeThatFits)
    }
}
