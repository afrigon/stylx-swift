import SwiftUI

struct ForegroundColorView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ColorView(text: "Default", style: .foregroundDefault, type: .foreground)
            ColorView(text: "Muted", style: .foregroundMuted, type: .foreground)
            ColorView(text: "onEmphasis", style: .foregroundOnEmphasis, type: .foreground)
            ColorView(text: "Disabled", style: .foregroundDisabled, type: .foreground)
            ColorView(text: "Link", style: .foregroundLink, type: .foreground)
        }
    }
}
