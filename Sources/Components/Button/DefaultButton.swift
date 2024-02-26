import SwiftUI

struct DefaultButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.isLoading) private var isLoading
    
    let scale: ButtonScale
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(scale.textStyle)
            .frame(height: scale.height)
            .padding(.horizontal, scale.horizontalPadding)
            .modify { view in
                if isEnabled {
                    view
                        .background(.backgroundMuted)
                        .foregroundStyle(.foregroundMuted)
                }
                else {
                    view
                        .background(.backgroundDisabled)
                        .foregroundStyle(.foregroundDisabled)
                }
            }
            .opacity(configuration.isPressed ? 0.8 : 1)
            .modify(if: isLoading) { view in
                view.overlay {
                    ProgressView()
                        .controlSize(scale.progressSize)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(.backgroundDisabled)
                        .tint(ForegroundShapeStyle.foregroundDisabled)
                }
            }
            .clipShape(.defaultRoundedRectangle)
            .overlay {
                RoundedRectangle.defaultRoundedRectangle
                    .strokeBorder(style: .default)
                    .modify { view in
                        if isEnabled && !isLoading {
                            view
                                .foregroundStyle(.borderMuted)
                        }
                        else {
                            view
                                .foregroundStyle(.borderDisabled)
                        }
                    }
            }
    }
}

#Preview {
    HStack {
        VStack(alignment: .leading) {
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .xs))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .s(.s)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .s(.l)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .m(.s)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .m(.l)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .l))
        }
        
        VStack(alignment: .leading) {
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .xs))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .s(.s)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .s(.l)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .m(.s)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .m(.l)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .l))
        }
        .disabled(true)
        
        VStack(alignment: .leading) {
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .xs))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .s(.s)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .s(.l)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .m(.s)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .m(.l)))
            Button("Send") {}
                .buttonStyle(DefaultButtonStyle(scale: .l))
        }
        .loading(true)
    }
    .environment(\.colorRole, .magic)
    .padding()
}
