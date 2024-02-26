import SwiftUI

struct ForegroundColor {
    private let `default`: ThemedColor
    private let muted: ThemedColor
    private let onEmphasis: ThemedColor
    private let disabled: ThemedColor
    private let link: ThemedColor
    
    static let `default`: ForegroundColor = .init(
        default: .init(light: .gray.value8),
        muted: .init(light: .gray.value6),
        onEmphasis: .init(light: .gray.value1),
        disabled: .init(light: .gray.value4),
        link: .init(light: .blue.value3)
    )
    
    func resolve(
        token: ForegroundToken,
        scheme: ColorScheme,
        contrast: ColorSchemeContrast
    ) -> Color {
        switch token {
            case .default:
                `default`.color(scheme: scheme, contrast: contrast)
            case .muted:
                muted.color(scheme: scheme, contrast: contrast)
            case .onEmphasis:
                onEmphasis.color(scheme: scheme, contrast: contrast)
            case .disabled:
                disabled.color(scheme: scheme, contrast: contrast)
            case .link:
                link.color(scheme: scheme, contrast: contrast)
        }
    }
}

#Preview {
    ForegroundColorView()
}
