import SwiftUI

extension ButtonStyle where Self == DefaultButtonStyle {
    public static func `default`(
        scale: ButtonScale = .m,
        format: ButtonFormat = .regular
    ) -> DefaultButtonStyle {
        DefaultButtonStyle(scale: scale, format: format)
    }
}

public struct DefaultButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.isLoading) private var isLoading
    
    let scale: ButtonScale
    let format: ButtonFormat
    
    public init(
        scale: ButtonScale = .m,
        format: ButtonFormat = .regular
    ) {
        self.scale = scale
        self.format = format
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .lineLimit(1)
            .textStyle(scale.textStyle)
            .padding(.vertical, scale.verticalPadding)
            .padding(.horizontal, format == .regular || format == .capsule ? scale.horizontalPadding : scale.verticalPadding)
            .modify(if: isLoading) { view in
                view
                    .foregroundStyle(.clear)
            }
            .modify { view in
                if isEnabled {
                    view
                        .background(.backgroundEmphasis)
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
                        .tint(ForegroundShapeStyle.foregroundDisabled)
#if !os(tvOS)
                        .controlSize(scale.progressSize)
#endif
                }
            }
            .clipShape(format.clipShape)
            .contentShape(format.clipShape)
            .overlay {
                format.clipShape
                    .stroke(style: .default)
                    .modify { view in
                        if isEnabled {
                            view
                                .foregroundStyle(.borderEmphasis)
                        }
                        else {
                            view
                                .foregroundStyle(.borderDisabled)
                        }
                    }
            }
    }
}

#Preview("Default") {
    ButtonsView(
        text: "Cancel",
        icon: "square.and.arrow.up"
    ) { scale, format in
        .default(scale: scale, format: format)
    }
}
