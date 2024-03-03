import SwiftUI

public struct SkeletonForm: View {
    public var body: some View {
        createView(.foreground)
            .shimmering(width: 1.5)
            .background(
                createView(.white.opacity(0.5))
            )
    }
    
    func createView<S: ShapeStyle>(_ style: S) -> some View {
        VStack(spacing: .m) {
            RoundedRectangle.doubleRoundedRectangle
                .fill(style)
                .frame(height: .xl)
            
            HStack(spacing: .m) {
                RoundedRectangle.doubleRoundedRectangle
                    .fill(style)
                    .frame(height: .xl)
                
                RoundedRectangle.doubleRoundedRectangle
                    .fill(style)
                    .frame(height: .xl)
            }
            
            RoundedRectangle.doubleRoundedRectangle
                .fill(style)
                .frame(height: .xl)
            
            HStack(spacing: .m) {
                RoundedRectangle.doubleRoundedRectangle
                    .fill(style)
                    .frame(height: .xl)
                
                Rectangle()
                    .frame(height: .xl)
                    .opacity(0)
            }
        }
    }
}

#Preview("Form") {
    SkeletonForm()
        .foregroundStyle(.backgroundEmphasis)
        .padding()
}
