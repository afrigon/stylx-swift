import SwiftUI

extension Font {
    static func roboto(size: CGFloat, weight: Weight = .regular) -> Font {
        FontRegister.shared.register(fontName: "RobotoFlex")
        
        return VariableFont.create(
            name: "Roboto Flex",
            size: size,
            weight: weight
        )
    }
}

#Preview("Roboto") {
    FontView { weight in
        .roboto(size: 16, weight: weight)
    }
}
