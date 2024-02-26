import SwiftUI

enum ColorType {
    case foreground
    case background
    case border
}

struct ColorView<S: ShapeStyle>: View {
    let text: String
    let style: S
    let type: ColorType
    
    var body: some View {
        Label(
            title: { Text(verbatim: text) },
            icon: {
                switch type {
                    case .foreground:
                        Text(verbatim: "Aa")
                            .font(.system(size: 24))
                            .fontWeight(.black)
                            .foregroundStyle(style)
                            .frame(width: 48, height: 48)
                    case .background:
                        RoundedRectangle(cornerRadius: 8)
                            .fill(style)
                            .frame(width: 48, height: 48)
                    case .border:
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(style, style: .emphasis)
                            .frame(width: .xxxl, height: .xxxl)
                }
            }
        )
    }
}
