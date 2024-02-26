import SwiftUI

public extension ShapeStyle where Self == BackgroundShapeStyle {
    static var backgroundDefault: BackgroundShapeStyle { .init(token: .default) }
    static var backgroundEmphasis: BackgroundShapeStyle { .init(token: .emphasis) }
    static var backgroundMuted: BackgroundShapeStyle { .init(token: .muted) }
    static var backgroundDisabled: BackgroundShapeStyle { .init(token: .disabled) }
    static var backgroundTransparent: BackgroundShapeStyle { .init(token: .transparent) }
    static var backgroundInverse: BackgroundShapeStyle { .init(token: .inverse) }
}

public struct BackgroundShapeStyle: ShapeStyle {
    let token: BackgroundToken
    
    public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        BackgroundColor.default.resolve(
            token: token,
            scheme: environment.colorScheme,
            contrast: environment.colorSchemeContrast,
            reduceTransparency: environment.accessibilityReduceTransparency
        )
    }
}
