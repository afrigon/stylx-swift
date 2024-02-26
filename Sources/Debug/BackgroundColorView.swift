import SwiftUI

struct BackgroundColorView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ColorView(text: "Default", style: .backgroundDefault, type: .background)
            ColorView(text: "Muted", style: .backgroundMuted, type: .background)
            ColorView(text: "Disabled", style: .backgroundDisabled, type: .background)
            ColorView(text: "Emphasis", style: .backgroundEmphasis, type: .background)
            ColorView(text: "Transparent", style: .backgroundTransparent, type: .background)
            ColorView(text: "Inverse", style: .backgroundInverse, type: .background)
        }
    }
}
