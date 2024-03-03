import SwiftUI

struct BorderColor {
    private let `default`: ThemedColor
    private let emphasis: ThemedColor
    private let muted: ThemedColor
    private let disabled: ThemedColor
    private let transparent: ThemedColor
    
    static let `default`: BorderColor = .init(
        default: .init(light: .gray.value2),
        emphasis: .init(light: .gray.value3),
        muted: .init(light: .gray.value1),
        disabled: .init(light: .gray.value3),
        transparent: .init(light: .clear, dark: .clear)
    )
    
    func resolve(
        token: BorderToken,
        scheme: ColorScheme,
        contrast: ColorSchemeContrast,
        reduceTransparency: Bool
    ) -> Color {
        switch token {
            case .default:
                `default`.color(scheme: scheme, contrast: contrast)
            case .emphasis:
                emphasis.color(scheme: scheme, contrast: contrast)
            case .muted:
                muted.color(scheme: scheme, contrast: contrast)
            case .disabled:
                disabled.color(scheme: scheme, contrast: contrast)
            case .transparent:
                if reduceTransparency {
                    `default`.color(scheme: scheme, contrast: contrast)
                }
                else {
                    transparent.color(scheme: scheme, contrast: contrast)
                }
        }
    }
}

#Preview {
    BorderColorView()
}
