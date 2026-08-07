import SwiftUI

private struct TextRoleKey: EnvironmentKey {
    static let defaultValue: TextRole = TextRole(
        text: { size, weight in
            .system(size: size, weight: weight)
        }
    )
}

extension EnvironmentValues {
    public var textRole: TextRole {
        get { self[TextRoleKey.self] }
        set { self[TextRoleKey.self] = newValue }
    }
}

public struct TextRole: Sendable {
    private let text: @Sendable (CGFloat, Font.Weight) -> Font
    private let code: @Sendable (CGFloat, Font.Weight) -> Font

    public init(
        text: @escaping @Sendable (CGFloat, Font.Weight) -> Font,
        code: @escaping @Sendable (CGFloat, Font.Weight) -> Font = { size, weight in
            .system(size: size, weight: weight, design: .monospaced)
        }
    ) {
        self.text = text
        self.code = code
    }

    public func resolve(style: TextStyle, scaled: Bool) -> Font {
        let size = scaled ? style.scaledSize : style.size

        return switch style {
            case .code:
                code(size, style.weight)
            default:
                text(size, style.weight)
        }
    }
}
