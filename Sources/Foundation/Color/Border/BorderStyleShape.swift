import SwiftUI

public extension ShapeStyle where Self == BorderShapeStyle {
    static var borderDefault: BorderShapeStyle { .init(token: .default) }
    static var borderEmphasis: BorderShapeStyle { .init(token: .emphasis) }
    static var borderMuted: BorderShapeStyle { .init(token: .muted) }
    static var borderDisabled: BorderShapeStyle { .init(token: .disabled) }
    static var borderTransparent: BorderShapeStyle { .init(token: .transparent) }
}

public struct BorderShapeStyle: ShapeStyle {
    let token: BorderToken
    
    public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        BorderColor.default.resolve(
            token: token,
            scheme: environment.colorScheme,
            contrast: environment.colorSchemeContrast,
            reduceTransparency: environment.accessibilityReduceTransparency
        )
    }
}
