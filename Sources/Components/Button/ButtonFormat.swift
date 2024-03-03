import SwiftUI

public enum ButtonFormat {
    case regular
    case circle
    case square
    case capsule
    
    public var clipShape: AnyShape {
        switch self {
            case .regular:
                AnyShape(.defaultRoundedRectangle)
            case .circle:
                AnyShape(Circle())
            case .capsule:
                AnyShape(Capsule())
            case .square:
                AnyShape(.defaultRoundedRectangle)
        }
    }
}
