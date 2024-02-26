import SwiftUI

extension Shape where Self == RoundedRectangle {
    
    /// 4px radius
    /// A shape with the default radius applied.
    public static var defaultRoundedRectangle: RoundedRectangle {
        RoundedRectangle(cornerRadius: Radius.default.value)
    }
    
    /// 8px radius
    /// A shape with the double radius applied.
    public static var doubleRoundedRectangle: RoundedRectangle {
        RoundedRectangle(cornerRadius: Radius.double.value)
    }
    
    /// Full radius
    /// A shape with the full radius applied.
    public static var full: RoundedRectangle {
        RoundedRectangle(cornerRadius: Radius.full.value)
    }
    
    /// Border radius
    /// A shape with the border radius applied.
    public static func border(_ border: Border) -> RoundedRectangle {
        RoundedRectangle(cornerRadius: border.value)
    }
}
