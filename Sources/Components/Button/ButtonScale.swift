import SwiftUI

public enum ButtonScale {
    case xs
    case s(TextScale)
    case m(TextScale)
    case l
    
    var progressSize: ControlSize {
        switch self {
            case .xs, .s:
                .mini
            case .m:
                .small
            case .l:
                .regular
        }
    }
    
    var textStyle: TextStyle {
        switch self {
            case .xs:
                .overline
            case .s(let scale), .m(let scale):
                .body(scale, .bold)
            case .l:
                .subtitle
        }
    }
    
    var horizontalPadding: CGFloat {
        switch self {
            case .xs:
                .s
            case .s, .m:
                .m
            case .l:
                .l
        }
    }
    
    var height: CGFloat {
        switch self {
            case .xs:
                22
            case .s:
                28
            case .m:
                36
            case .l:
                48
        }
    }
}
