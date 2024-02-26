import SwiftUI

struct ColorScaleView: View {
    @State var hue: Hue
    
    var values: [ColorIdentifier] {
        Tint.allCases.map { ColorIdentifier(hue: hue, tint: $0) }
    }
    
    var body: some View {
        VStack {
            Picker("Hue", selection: $hue) {
                ForEach(Hue.allCases, id: \.self) { hue in
                    Text(verbatim: hue.description).tag(hue)
                }
            }
            .tint(ColorIdentifier(hue: hue, tint: .value5).color)
            .padding(.top, 24)
            
            GeometryReader { geometry in
                VStack(spacing: .zero) {
                    ForEach(Array(values.enumerated()), id: \.offset) { i, id in
                        Rectangle()
                            .fill(id.color)
                            .frame(height: geometry.size.height / CGFloat(values.count))
                            .frame(maxWidth: .infinity)
                            .overlay {
                                Text(verbatim: id.description)
                                    .foregroundStyle(i > 5 ? Color.white : Color.black)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
        }
    }
}
