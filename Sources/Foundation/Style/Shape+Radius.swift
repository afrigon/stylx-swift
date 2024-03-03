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
    
    /// Border radius
    /// A shape with the border radius applied.
    public static func border(_ border: Border) -> RoundedRectangle {
        RoundedRectangle(cornerRadius: border.value)
    }
}

extension Shape where Self == Capsule {
    
    /// Full radius
    /// A shape with the full radius applied.
    public static var full: Capsule {
        Capsule()
    }
}
