import SwiftUI

extension View {
    
    /// A view with a shadow of given radius.
    public func shadow(radius: Radius) -> some View {
        shadow(color: .black.opacity(0.2), radius: radius.value)
    }
}
