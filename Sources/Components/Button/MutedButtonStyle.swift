import SwiftUI

extension ButtonStyle where Self == MutedButtonStyle {
    public static func muted(
        scale: ButtonScale = .m,
        format: ButtonFormat = .regular
    ) -> MutedButtonStyle {
        MutedButtonStyle(scale: scale, format: format)
    }
}

public struct MutedButtonStyle: ButtonStyle {
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

#Preview("Neutral") {
    ButtonsView(
        text: "Next",
        icon: "square.and.arrow.up"
    ) { scale, format in
        .muted(scale: scale, format: format)
    }
    .environment(\.colorRole, .neutral)
}

#Preview("Information") {
    ButtonsView(
        text: "Send",
        icon: "info.circle.fill"
    ) { scale, format in
        .muted(scale: scale, format: format)
    }
    .environment(\.colorRole, .information)
}

#Preview("Success") {
    ButtonsView(
        text: "Add",
        icon: "person.fill.badge.plus"
    ) { scale, format in
        .muted(scale: scale, format: format)
    }
    .environment(\.colorRole, .success)
}

#Preview("Warning") {
    ButtonsView(
        text: "OK",
        icon: "exclamationmark.triangle.fill"
    ) { scale, format in
        .muted(scale: scale, format: format)
    }
    .environment(\.colorRole, .warning)
}

#Preview("Critical") {
    ButtonsView(
        text: "Delete",
        icon: "trash.fill"
    ) { scale, format in
        .muted(scale: scale, format: format)
    }
    .environment(\.colorRole, .critical)
}

#Preview("Magic") {
    ButtonsView(
        text: "Generate",
        icon: "wand.and.stars"
    ) { scale, format in
        .muted(scale: scale, format: format)
    }
    .environment(\.colorRole, .magic)
}
