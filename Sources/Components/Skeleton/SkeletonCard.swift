import SwiftUI

public struct SkeletonCard: View {
    public init() {

    }

    public var body: some View {
        Card {
            SkeletonParagraph()
                .padding(.l)
        }
    }
}

#Preview("Card") {
    SkeletonCard()
        .foregroundStyle(.backgroundEmphasis)
        .padding()
}
