import SwiftUI

public struct SkeletonParagraph: View {
    public init() {

    }

    public var body: some View {
        createView(.foreground)
            .shimmering(width: 1.5)
            .background(
                createView(.white.opacity(0.5))
            )
    }
    
    func createView<S: ShapeStyle>(_ style: S) -> some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: .m) {
                RoundedRectangle.doubleRoundedRectangle
                    .fill(style)
                    .frame(width: geometry.size.width * 0.6, height: .xl)
                
                RoundedRectangle.doubleRoundedRectangle
                    .fill(style)
                    .frame(height: .m)
                
                RoundedRectangle.doubleRoundedRectangle
                    .fill(style)
                    .frame(height: .m)
                
                RoundedRectangle.doubleRoundedRectangle
                    .fill(style)
                    .frame(width: geometry.size.width * 0.8, height: .m)
            }
        }
        .frame(height: .m * 6 + .xl)
    }
}

#Preview("Paragraph") {
    SkeletonParagraph()
        .foregroundStyle(.backgroundEmphasis)
        .padding()
}
