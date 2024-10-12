import SwiftUI

public enum ButtonScale {
    case xs
    case s
    case m
    case l
    
#if !os(tvOS)
    public var progressSize: ControlSize {
        switch self {
            case .xs, .s:
                .mini
            case .m:
                .small
            case .l:
                .regular
        }
    }
#endif
    
    public var textStyle: TextStyle {
        switch self {
            case .xs:
                .overline
            case .s:
                .body(.s, .bold)
            case .m:
                .body(.l, .bold)
            case .l:
                .subtitle
        }
    }

    public var verticalPadding: CGFloat {
        switch self {
            case .xs:
                .xs
            case .s:
                .xs
            case .m:
                .s
            case .l:
                .m
        }
    }

    public var horizontalPadding: CGFloat {
        switch self {
            case .xs:
                .xs
            case .s:
                .s
            case .m:
                .m
            case .l:
                .l
        }
    }
}
