import SwiftUI

struct MutedButtonStyle: ButtonStyle {
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
                        .background(.roleMuted)
                        .foregroundStyle(.roleForeground)
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
                                .foregroundStyle(.roleBorderMuted)
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
                .buttonStyle(MutedButtonStyle(scale: .xs))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .s(.s)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .s(.l)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .m(.s)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .m(.l)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .l))
        }
        
        VStack(alignment: .leading) {
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .xs))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .s(.s)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .s(.l)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .m(.s)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .m(.l)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .l))
        }
        .disabled(true)
        
        VStack(alignment: .leading) {
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .xs))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .s(.s)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .s(.l)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .m(.s)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .m(.l)))
            Button("Send") {}
                .buttonStyle(MutedButtonStyle(scale: .l))
        }
        .loading(true)
    }
    .environment(\.colorRole, .magic)
    .padding()
}
