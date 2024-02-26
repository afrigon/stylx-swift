import Foundation

/// Border width values used for borders and dividers.
public enum Border {
    
    /// 1px border
    /// The 1 px border is the most common and is used for dividers and border on many different elements.
    case `default`
    
    /// 2px border
    /// The 2 px border is used to emphasize weight and is used for sliders, medium divider, etc.
    case emphasis
    
    /// 4px border
    /// The 4 px border is only used for large divider.
    case large
    
    /// The border value as a CGFloat.
    public var value: CGFloat {
        switch self {
            case .default:
                1
            case .emphasis:
                2
            case .large:
                4
        }
    }
}
