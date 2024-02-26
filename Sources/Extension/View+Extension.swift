import SwiftUI

extension View {
    public func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

    public func modify(@ViewBuilder _ modifier: (Self) -> some View) -> some View {
        modifier(self)
    }
    
    public func modify(if condition: () -> Bool, @ViewBuilder _ modifier: (Self) -> some View) -> some View {
        if condition() {
            modifier(self).eraseToAnyView()
        }
        else {
            eraseToAnyView()
        }
    }
    
    public func modify(if condition: Bool, @ViewBuilder _ modifier: (Self) -> some View) -> some View {
        if condition {
            modifier(self).eraseToAnyView()
        }
        else {
            eraseToAnyView()
        }
    }
}
