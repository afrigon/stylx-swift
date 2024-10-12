import SwiftUI
import CoreText

extension Font {
    public static func apercu(size: CGFloat, weight: Weight = .regular) -> Font {
        FontRegister.shared.register(fontName: "ApercuFlex")

        return VariableFont.create(
            name: "Apercu Pro",
            size: size,
            weight: weight
        )
    }
}

#Preview("Apercu") {
    FontView { weight in
        .apercu(size: 16, weight: weight)
    }
    .padding()
}
