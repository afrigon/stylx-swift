import SwiftUI

private struct ColorRoleKey: EnvironmentKey {
    static var defaultValue: ColorRole = .neutral
}

extension EnvironmentValues {
    var colorRole: ColorRole {
        get { self[ColorRoleKey.self] }
        set { self[ColorRoleKey.self] = newValue }
    }
}

public struct ColorRole {
    private let emphasis: ThemedColor
    private let muted: ThemedColor
    private let foreground: ThemedColor
    private let borderEmphasis: ThemedColor
    private let borderMuted: ThemedColor
    
    public init(
        emphasis: ColorIdentifier,
        muted: ColorIdentifier,
        foreground: ColorIdentifier? = nil,
        borderEmphasis: ColorIdentifier? = nil,
        borderMuted: ColorIdentifier? = nil
    ) {
        self.emphasis = ThemedColor(light: emphasis)
        self.muted = ThemedColor(light: muted)
        self.foreground = ThemedColor(light: foreground ?? emphasis)
        self.borderEmphasis = ThemedColor(light: borderEmphasis ?? emphasis)
        self.borderMuted = ThemedColor(light: borderMuted ?? muted)
    }
    
    public init(
        emphasis: ThemedColor,
        muted: ThemedColor,
        foreground: ThemedColor? = nil,
        borderEmphasis: ThemedColor? = nil,
        borderMuted: ThemedColor? = nil
    ) {
        self.emphasis = emphasis
        self.muted = muted
        self.foreground = foreground ?? emphasis
        self.borderEmphasis = borderEmphasis ?? emphasis
        self.borderMuted = borderMuted ?? muted
    }
    
    func resolve(
        token: ColorRoleToken,
        scheme: ColorScheme,
        contrast: ColorSchemeContrast
    ) -> Color {
        switch token {
            case .emphasis:
                emphasis.color(scheme: scheme, contrast: contrast)
            case .muted:
                muted.color(scheme: scheme, contrast: contrast)
            case .foreground:
                foreground.color(scheme: scheme, contrast: contrast)
            case .borderEmphasis:
                borderEmphasis.color(scheme: scheme, contrast: contrast)
            case .borderMuted:
                borderMuted.color(scheme: scheme, contrast: contrast)
        }
    }
}

#Preview("Neutral") {
    ColorRoleView()
        .environment(\.colorRole, .neutral)
}

#Preview("Information") {
    ColorRoleView()
        .environment(\.colorRole, .information)
}

#Preview("Success") {
    ColorRoleView()
        .environment(\.colorRole, .success)
}

#Preview("Warning") {
    ColorRoleView()
        .environment(\.colorRole, .warning)
}

#Preview("Critical") {
    ColorRoleView()
        .environment(\.colorRole, .critical)
}

#Preview("Magic") {
    ColorRoleView()
        .environment(\.colorRole, .magic)
}
