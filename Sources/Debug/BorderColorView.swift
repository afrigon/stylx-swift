import SwiftUI

struct BorderColorView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ColorView(text: "Default", style: .borderDefault, type: .border)
            ColorView(text: "Emphasis", style: .borderEmphasis, type: .border)
            ColorView(text: "Muted", style: .borderMuted, type: .border)
            ColorView(text: "Disabled", style: .borderDisabled, type: .border)
            ColorView(text: "Transparent", style: .borderTransparent, type: .border)
        }
    }
}
