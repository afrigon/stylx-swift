import SwiftUI

struct Shimmer: ViewModifier {
    @Environment(\.layoutDirection) private var layoutDirection
    
    private let animation: Animation
    private let gradient: Gradient
    private let min, max: CGFloat
    
    @State private var isInitialState = true

    init(
        animation: Animation = defaultAnimation,
        gradient: Gradient = defaultGradient,
        width: CGFloat = 0.3
    ) {
        self.animation = animation
        self.gradient = gradient
        self.min = 0 - width
        self.max = 1 + width
    }

    static let defaultAnimation: Animation = .linear(duration: 1.5)
        .delay(1)
        .repeatForever(autoreverses: false)

    static let defaultGradient = Gradient(colors: [
        .black,
        .black.opacity(0.3),
        .black
    ])

    var startPoint: UnitPoint {
        if layoutDirection == .rightToLeft {
            return isInitialState ? UnitPoint(x: max, y: min) : UnitPoint(x: 0, y: 1)
        } else {
            return isInitialState ? UnitPoint(x: min, y: min) : UnitPoint(x: 1, y: 1)
        }
    }

    var endPoint: UnitPoint {
        if layoutDirection == .rightToLeft {
            return isInitialState ? UnitPoint(x: 1, y: 0) : UnitPoint(x: min, y: max)
        } else {
            return isInitialState ? UnitPoint(x: 0, y: 0) : UnitPoint(x: max, y: max)
        }
    }
    
    func body(content: Content) -> some View {
        content
            .mask {
                LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
            }
            .animation(animation, value: isInitialState)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    isInitialState = false
                }
            }
    }
}

extension View {
    func shimmering(
        animation: Animation = Shimmer.defaultAnimation,
        gradient: Gradient = Shimmer.defaultGradient,
        width: CGFloat = 0.3
    ) -> some View {
        modifier(Shimmer(animation: animation, gradient: gradient, width: width))
    }
}
