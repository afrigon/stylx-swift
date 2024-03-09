import SwiftUI

public enum TextScale {
    case s
    case l
}

public enum TextWeight {
    case regular
    case bold
    
    var value: Font.Weight {
        switch self {
            case .regular:
                    .regular
            case .bold:
                    .bold
        }
    }
}

public enum TextStyle {
    case heading1
    case heading2
    case heading3
    case subtitle
    case body(TextScale, TextWeight)
    case code(TextScale)
    case overline
    case disclaimer
    
    var size: CGFloat {
        switch self {
            case .heading1:
                48
            case .heading2:
                32
            case .heading3:
                24
            case .subtitle:
                18
            case .body(let textScale, _):
                switch textScale {
                    case .s:
                        13
                    case .l:
                        16
                }
            case .code(let textScale):
                switch textScale {
                    case .s:
                        13
                    case .l:
                        15
                }
            case .overline:
                12
            case .disclaimer:
                11
        }
    }
    
    #if canImport(UIKit)
    var relatesTo: UIFont.TextStyle {
        switch self {
            case .heading1:
                .title1
            case .heading2:
                .title2
            case .heading3:
                .title3
            case .subtitle:
                .subheadline
            case .body:
                .body
            case .code:
                .body
            case .overline:
                .caption1
            case .disclaimer:
                .footnote
        }
    }
    
    var scaledSize: CGFloat {
        UIFontMetrics(forTextStyle: relatesTo).scaledValue(for: size)
    }
    #endif
    
    #if canImport(AppKit)
    var scaledSize: CGFloat {
        size
    }
    #endif
    
    var font: Font {
        switch self {
            case .heading1, .heading2, .heading3:
                .apercu(size: size, weight: .medium)
            case .subtitle, .overline:
                .apercu(size: size, weight: .bold)
            case .disclaimer:
                .apercu(size: size, weight: .regular)
            case .body(_, let weight):
                .apercu(size: size, weight: weight.value)
            case .code:
                .monaspace(size: size, weight: .regular)
        }
    }
    
    var scaledFont: Font {
        switch self {
            case .heading1, .heading2, .heading3:
                .apercu(size: scaledSize, weight: .medium)
            case .subtitle, .overline:
                .apercu(size: scaledSize, weight: .bold)
            case .disclaimer:
                .apercu(size: scaledSize, weight: .regular)
            case .body(_, let weight):
                .apercu(size: scaledSize, weight: weight.value)
            case .code:
                .monaspace(size: scaledSize, weight: .regular)
        }
    }
    
    var textCase: Text.Case? {
        switch self {
            case .overline:
                .uppercase
            default:
                nil
        }
    }
}

struct TextStyleModifier: ViewModifier {
    @Environment(\.dynamicTypeSize) var dynamicTextSize
    
    let textStyle: TextStyle
    let scaled: Bool
    
    init(textStyle: TextStyle, scaled: Bool) {
        self.textStyle = textStyle
        self.scaled = scaled
    }
    
    func body(content: Content) -> some View {
        content
            .font(scaled ? textStyle.scaledFont : textStyle.font)
            .textCase(textStyle.textCase)
    }
}

extension Text {
    
    /// note: this fonction will not apply text case to preseve the text type
    public func textStyle(_ textStyle: TextStyle, scaled: Bool = true) -> Text {
        font(scaled ? textStyle.scaledFont : textStyle.font)
    }
}

extension View {
    public func textStyle(_ textStyle: TextStyle, scaled: Bool = true) -> some View {
        modifier(TextStyleModifier(textStyle: textStyle, scaled: scaled))
    }
}

#Preview {
    VStack(alignment: .leading) {
        Text("Heading 1")
            .textStyle(.heading1)
        Text("Heading 2")
            .textStyle(.heading2)
        Text("Heading 3")
            .textStyle(.heading3)
        Text("Subtitle")
            .textStyle(.subtitle)
        Text("Body Large Bold")
            .textStyle(.body(.l, .bold))
        Text("Body Large")
            .textStyle(.body(.l, .regular))
        Text("Body Small Bold")
            .textStyle(.body(.s, .bold))
        Text("Body Small")
            .textStyle(.body(.s, .regular))
        Text("Code Large")
            .textStyle(.code(.l))
        Text("Code Small")
            .textStyle(.code(.s))
        Text("Overline")
            .textStyle(.overline)
        Text("Disclaimer")
            .textStyle(.disclaimer)
    }
    .environment(\.dynamicTypeSize, .large)
    .padding()
}
