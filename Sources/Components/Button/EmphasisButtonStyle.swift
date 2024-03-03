import SwiftUI

extension ButtonStyle where Self == EmphasisButtonStyle {
    public static func emphasis(
        scale: ButtonScale = .m,
        format: ButtonFormat = .regular
    ) -> EmphasisButtonStyle {
        EmphasisButtonStyle(scale: scale, format: format)
    }
}

public struct EmphasisButtonStyle: ButtonStyle {
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
            .padding(.horizontal, format == .regular ? scale.horizontalPadding : scale.verticalPadding)
            .modify(if: isLoading) { view in
                view
                    .foregroundStyle(.clear)
            }
            .modify { view in
                if isEnabled {
                    view
                        .background(.roleEmphasis)
                        .foregroundStyle(.foregroundOnEmphasis)
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
                        .tint(ForegroundShapeStyle.foregroundDisabled)
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
                                .foregroundStyle(.roleBorderEmphasis)
                        }
                        else {
                            view
                                .foregroundStyle(.borderDisabled)
                        }
                    }
            }
    }
}

#Preview("Neutral") {
    ButtonsView(
        text: "Next",
        icon: "square.and.arrow.up"
    ) { scale, format in
        .emphasis(scale: scale, format: format)
    }
    .environment(\.colorRole, .neutral)
}

#Preview("Information") {
    ButtonsView(
        text: "Send",
        icon: "info.circle.fill"
    ) { scale, format in
        .emphasis(scale: scale, format: format)
    }
    .environment(\.colorRole, .information)
}

#Preview("Success") {
    ButtonsView(
        text: "Add",
        icon: "person.fill.badge.plus"
    ) { scale, format in
        .emphasis(scale: scale, format: format)
    }
    .environment(\.colorRole, .success)
}

#Preview("Warning") {
    ButtonsView(
        text: "OK",
        icon: "exclamationmark.triangle.fill"
    ) { scale, format in
        .emphasis(scale: scale, format: format)
    }
    .environment(\.colorRole, .warning)
}

#Preview("Critical") {
    ButtonsView(
        text: "Delete",
        icon: "trash.fill"
    ) { scale, format in
        .emphasis(scale: scale, format: format)
    }
    .environment(\.colorRole, .critical)
}

#Preview("Magic") {
    ButtonsView(
        text: "Generate",
        icon: "wand.and.stars"
    ) { scale, format in
        .emphasis(scale: scale, format: format)
    }
    .environment(\.colorRole, .magic)
}
