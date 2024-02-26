import Foundation

/// Radius values used for rounded corners.
public enum Radius {
    
    /// 4px radius
    /// The 4px radius is used in most places.
    case `default`
    
    /// 8px radius
    /// The double radius is used for larger elements like cards.
    case double
    
    /// Full radius
    /// The full radius is used for perfectly rounded element like a profile picture.
    case full
    
    /// Border Radius
    /// The border radius will match the width of the border allowing to have the inside of the border perfectly square and the outside perfectly rounded.
    /// This is used for smaller elements like a checkbox.
    case border(width: Border)
    
    /// The radius value as a CGFloat.
    public var value: CGFloat {
        switch self {
            case .default:
                4
            case .double:
                8
            case .full:
                .infinity
            case .border(let width):
                width.value
        }
    }
}
