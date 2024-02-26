enum Hue: CaseIterable, Hashable {
    case lime
    case red
    case orange
    case yellow
    case green
    case teal
    case blue
    case purple
    case pink
    case gray
}

extension Hue: CustomStringConvertible {
    public var description: String {
        switch self {
            case .lime:
                "Lime"
            case .red:
                "Red"
            case .orange:
                "Orange"
            case .yellow:
                "Yellow"
            case .green:
                "Green"
            case .teal:
                "Teal"
            case .blue:
                "Blue"
            case .purple:
                "Purple"
            case .pink:
                "Pink"
            case .gray:
                "Gray"
        }
    }
}
