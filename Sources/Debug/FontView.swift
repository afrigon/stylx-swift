import SwiftUI

public struct FontView: View {
    let value = "The quick brown fox jumps over the lazy dog"
    let weights: [Font.Weight] = [.black, .heavy, .bold, .semibold, .medium, .regular, .light, .thin, .ultraLight]
    
    let font: (Font.Weight) -> Font
    
    public init(font: @escaping (Font.Weight) -> Font) {
        self.font = font
    }
    
    public var body: some View {
        VStack {
            ForEach(weights, id: \.value) { weight in
                Text(verbatim: value)
                    .font(font(weight))
            }
        }
    }
}
