import SwiftUI

public struct Badge: View {
    let text: LocalizedStringResource
    
    public var body: some View {
        Text(text)
            .lineLimit(1)
            .textStyle(.overline)
            .padding(.horizontal, .xs)
            .padding(.vertical, .xxxs)
            .background(.roleMuted)
            .foregroundStyle(.roleForeground)
            .clipShape(.full)
            .overlay {
                RoundedRectangle.full
                    .stroke(style: .default)
                    .foregroundStyle(.roleBorderMuted)
            }
    }
}

#Preview {
    VStack {
        Badge(text: "Failed")
            .environment(\.colorRole, .critical)
        Badge(text: "Pending")
            .environment(\.colorRole, .warning)
        Badge(text: "Approved")
            .environment(\.colorRole, .success)
    }
    .padding()
}
