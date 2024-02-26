import SwiftUI

public extension ShapeStyle where Self == ColorRoleShapeStyle {
    static var roleEmphasis: ColorRoleShapeStyle { .init(token: .emphasis) }
    static var roleMuted: ColorRoleShapeStyle { .init(token: .muted) }
    static var roleForeground: ColorRoleShapeStyle { .init(token: .foreground) }
    static var roleBorderEmphasis: ColorRoleShapeStyle { .init(token: .borderEmphasis) }
    static var roleBorderMuted: ColorRoleShapeStyle { .init(token: .borderMuted) }
}

public struct ColorRoleShapeStyle: ShapeStyle {
    let token: ColorRoleToken
    
    public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        environment.colorRole.resolve(
            token: token,
            scheme: environment.colorScheme,
            contrast: environment.colorSchemeContrast
        )
    }
}
