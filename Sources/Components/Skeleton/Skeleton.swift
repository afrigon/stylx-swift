import SwiftUI

public struct Skeleton: View {
    public enum Scale {
        case s
        case l
        
        var height: CGFloat {
            switch self {
                case .s:
                    .m
                case .l:
                    .xl
            }
        }
    }
    
    let scale: Scale
    
    public init() {
        self.init(scale: .l)
    }
    
    public init(scale: Scale) {
        self.scale = scale
    }
    
    public var body: some View {
        createView(.foreground)
            .shimmering(width: 1.5)
            .background(
                createView(.white.opacity(0.5))
            )
    }
    
    func createView<S: ShapeStyle>(_ style: S) -> some View {
        RoundedRectangle.doubleRoundedRectangle
            .fill(style)
            .frame(height: scale.height)
    }
}

#Preview("Large") {
    Skeleton(scale: .l)
        .foregroundStyle(.backgroundEmphasis)
        .padding()
}

#Preview("Small") {
    Skeleton(scale: .s)
        .foregroundStyle(.backgroundEmphasis)
        .padding()
}
