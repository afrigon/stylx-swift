import SwiftUI

public enum ButtonFormat {
    case regular
    case circle
    case square
    
    public var clipShape: AnyShape {
        switch self {
            case .regular:
                AnyShape(.defaultRoundedRectangle)
            case .circle:
                AnyShape(Circle())
            case .square:
                AnyShape(.defaultRoundedRectangle)
        }
    }
}
