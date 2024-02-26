import SwiftUI

public struct Card<Content: View>: View {
    let content: () -> Content
    
    public var body: some View {
        content()
            .background(.backgroundMuted)
            .clipShape(.doubleRoundedRectangle)
            .shadow(radius: .default)
    }
}

#Preview {
    Card {
        Text("Hello World!")
            .padding(.l)
    }
    .padding()
}
