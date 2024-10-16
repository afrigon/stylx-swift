import SwiftUI

public enum TitleDisplayMode {
    case automatic
    case inline

    @available(tvOS, unavailable)
    case large

#if canImport(UIKit)
    var navigationBarTitleDisplayMode: NavigationBarItem.TitleDisplayMode {
        switch self {
        case .automatic:
            return .automatic
        case .inline:
            return .inline
        case .large:
            return .large
        }
    }
#endif
}

extension View {

    /// Sets the title and display mode for this view when applicable.
    public func title(
        _ title: LocalizedStringKey,
        displayMode: TitleDisplayMode = .automatic
    ) -> some View {
        self
            .navigationTitle(title)
        #if os(iOS) || os(watchOS) || os(visionOS) || targetEnvironment(macCatalyst)
            .navigationBarTitleDisplayMode(displayMode.navigationBarTitleDisplayMode)
        #endif
    }

    /// Sets the title display mode for this view when applicable.
    public func titleDisplayMode(
        _ displayMode: TitleDisplayMode = .automatic
    ) -> some View {
        self
        #if os(iOS) || os(watchOS) || os(visionOS) || targetEnvironment(macCatalyst)
            .navigationBarTitleDisplayMode(displayMode.navigationBarTitleDisplayMode)
        #endif
    }
}
