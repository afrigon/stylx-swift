import SwiftUI

public struct Separator<S: ShapeStyle>: View {
    public enum Direction {
        case vertical
        case horizontal
    }
    
    public enum Size {
        case `default`
        case emphasis
        case large
        
        var value: CGFloat {
            switch self {
                case .default:
                    Border.default.value
                case .emphasis:
                    Border.emphasis.value
                case .large:
                    Border.large.value
            }
        }
    }
    
    let direction: Direction
    let size: Size
    let color: S
    
    public init(
        direction: Direction,
        size: Size = .default,
        color: S = .borderEmphasis
    ) {
        self.direction = direction
        self.size = size
        self.color = color
    }
    
    public var body: some View {
        Divider()
            .modify { view in
                switch direction {
                    case .horizontal:
                        view.frame(height: size.value)
                    case .vertical:
                        view.frame(width: size.value)
                }
            }
            .background(color)
    }
}

#Preview {
    VStack(spacing: .l) {
        Separator(direction: .horizontal, size: .default, color: .borderEmphasis)
        Separator(direction: .horizontal, size: .emphasis, color: .borderEmphasis)
        Separator(direction: .horizontal, size: .large, color: .borderEmphasis)
    }
}
