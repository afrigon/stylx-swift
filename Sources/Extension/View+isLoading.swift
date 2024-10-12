import SwiftUI

private struct LoadingKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    public var isLoading: Bool {
        get { self[LoadingKey.self] }
        set { self[LoadingKey.self] = newValue }
    }
}

extension View {
    public func loading(_ loading: Bool) -> some View {
        environment(\.isLoading, loading)
    }
}
