import SwiftUI

public struct SkeletonCode: View {
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
                    .frame(width: geometry.size.width * 0.8, height: .m)
                
                HStack(spacing: .zero) {
                    Spacer()
                    
                    RoundedRectangle.doubleRoundedRectangle
                        .fill(style)
                        .frame(width: geometry.size.width * 0.8, height: .m)
                }
                
                RoundedRectangle.doubleRoundedRectangle
                    .fill(style)
                    .frame(width: geometry.size.width * 0.8, height: .m)
            }
        }
        .frame(height: .m * 5)
    }
}

#Preview("Code") {
    SkeletonCode()
        .foregroundStyle(.backgroundEmphasis)
        .padding()
}
