import SwiftUI

public struct ColorIdentifier: Hashable, Sendable {
    let hue: Hue
    let tint: Tint
    
    public static var lime: ColorIdentifier {
        .init(hue: .lime, tint: .value5)
    }
    
    public static var red: ColorIdentifier {
        .init(hue: .red, tint: .value5)
    }
    
    public static var orange: ColorIdentifier {
        .init(hue: .orange, tint: .value5)
    }
    
    public static var yellow: ColorIdentifier {
        .init(hue: .yellow, tint: .value5)
    }
    
    public static var green: ColorIdentifier {
        .init(hue: .green, tint: .value5)
    }
    
    public static var teal: ColorIdentifier {
        .init(hue: .teal, tint: .value5)
    }
    
    public static var blue: ColorIdentifier {
        .init(hue: .blue, tint: .value5)
    }
    
    public static var purple: ColorIdentifier {
        .init(hue: .purple, tint: .value5)
    }
    
    public static var pink: ColorIdentifier {
        .init(hue: .pink, tint: .value5)
    }
    
    public static var gray: ColorIdentifier {
        .init(hue: .gray, tint: .value5)
    }
    
    public static var white: ColorIdentifier {
        .init(hue: .gray, tint: .value0)
    }
    
    public static var black: ColorIdentifier {
        .init(hue: .gray, tint: .value9)
    }
    
    public var value0: ColorIdentifier {
        .init(hue: hue, tint: .value0)
    }
    
    public var value1: ColorIdentifier {
        .init(hue: hue, tint: .value1)
    }
    
    public var value2: ColorIdentifier {
        .init(hue: hue, tint: .value2)
    }
    
    public var value3: ColorIdentifier {
        .init(hue: hue, tint: .value3)
    }
    
    public var value4: ColorIdentifier {
        .init(hue: hue, tint: .value4)
    }
    
    public var value5: ColorIdentifier {
        .init(hue: hue, tint: .value5)
    }
    
    public var value6: ColorIdentifier {
        .init(hue: hue, tint: .value6)
    }
    
    public var value7: ColorIdentifier {
        .init(hue: hue, tint: .value7)
    }
    
    public var value8: ColorIdentifier {
        .init(hue: hue, tint: .value8)
    }
    
    public var value9: ColorIdentifier {
        .init(hue: hue, tint: .value9)
    }
    
    public func inverse() -> ColorIdentifier {
        .init(hue: hue, tint: tint.inverse)
    }
    
    public func lighter() -> ColorIdentifier {
        .init(hue: hue, tint: tint.lighter)
    }
    
    public func darker() -> ColorIdentifier {
        .init(hue: hue, tint: tint.darker)
    }
    
    public var color: Color {
        Palette.color(id: self)
    }
}

extension ColorIdentifier: CustomStringConvertible {
    public var description: String {
        "\(hue.description) \(tint.description)"
    }
}
