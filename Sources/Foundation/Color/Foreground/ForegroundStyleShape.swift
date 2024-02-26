import SwiftUI

public extension ShapeStyle where Self == ForegroundShapeStyle {
    static var foregroundDefault: ForegroundShapeStyle { .init(token: .default) }
    static var foregroundMuted: ForegroundShapeStyle { .init(token: .muted) }
    static var foregroundOnEmphasis: ForegroundShapeStyle { .init(token: .onEmphasis) }
    static var foregroundDisabled: ForegroundShapeStyle { .init(token: .disabled) }
    static var foregroundLink: ForegroundShapeStyle { .init(token: .link) }
}

public struct ForegroundShapeStyle: ShapeStyle {
    let token: ForegroundToken
    
    public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        ForegroundColor.default.resolve(
            token: token,
            scheme: environment.colorScheme,
            contrast: environment.colorSchemeContrast
        )
    }
}
