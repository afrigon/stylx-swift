import SwiftUI

public struct ColorRoleView: View {
    @Environment(\.colorRole) var colorRole
    
    public var body: some View {
        VStack(alignment: .leading) {
            ColorView(text: "Emphasis", style: .roleEmphasis, type: .background)
            ColorView(text: "Muted", style: .roleMuted, type: .background)
            ColorView(text: "Foreground", style: .roleForeground, type: .foreground)
            ColorView(text: "Border Emphasis", style: .roleBorderEmphasis, type: .border)
            ColorView(text: "Border Muted", style: .roleBorderMuted, type: .border)
        }
        .padding()
    }
}
