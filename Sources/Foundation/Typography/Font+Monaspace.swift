import SwiftUI

extension Font {
    public static func monaspace(size: CGFloat, weight: Weight = .regular) -> Font {
        FontRegister.shared.register(fontName: "MonaspaceNeonFlex")

        return VariableFont.create(
            name: "Monaspace Neon Var",
            size: size,
            weight: weight
        )
    }
}

#Preview("Monaspace Neon") {
    VStack {
        FontView { weight in
            .monaspace(size: 12, weight: weight)
        }
    }
}
