import SwiftUI

struct ButtonView<B: View, S: ButtonStyle>: View {
    let button: () -> B
    let style: (ButtonScale) -> S
    
    var body: some View {
        HStack(alignment: .bottom) {
            button()
                .buttonStyle(style(.xs))
            button()
                .buttonStyle(style(.s))
            button()
                .buttonStyle(style(.m))
            button()
                .buttonStyle(style(.l))
        }
    }
}

struct ButtonsView<S: ButtonStyle>: View {
    let text: String
    let icon: String
    let style: (ButtonScale, ButtonFormat) -> S
    
    var body: some View {
        ScrollView {
            VStack(spacing: .l) {
                ButtonView { Button(text) {} } style: { style($0, .regular) }
                ButtonView { Button(text) {} } style: { style($0, .regular) }
                    .disabled(true)
                ButtonView { Button(text) {} } style: { style($0, .regular) }
                    .disabled(true)
                    .loading(true)
                
                ButtonView { Button(action: {}, label: { Image(systemName: icon) }) } style: { style($0, .square) }
                ButtonView { Button(action: {}, label: { Image(systemName: icon) }) } style: { style($0, .square) }
                    .disabled(true)
                ButtonView { Button(action: {}, label: { Image(systemName: icon) }) } style: { style($0, .square) }
                    .disabled(true)
                    .loading(true)
                
                ButtonView { Button(action: {}, label: { Image(systemName: icon) }) } style: { style($0, .circle) }
                ButtonView { Button(action: {}, label: { Image(systemName: icon) }) } style: { style($0, .circle) }
                    .disabled(true)
                ButtonView { Button(action: {}, label: { Image(systemName: icon) }) } style: { style($0, .circle) }
                    .disabled(true)
                    .loading(true)
            }
            .padding()
        }
    }
}
