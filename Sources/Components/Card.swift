import SwiftUI

public struct Card<Content: View>: View {
    let content: () -> Content
    
    public var body: some View {
        content()
            .background(.backgroundDefault)
            .clipShape(RoundedRectangle(cornerRadius: .l))
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
