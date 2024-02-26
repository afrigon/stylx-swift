import SwiftUI

extension StrokeStyle {
    
    /// 1px border
    /// A `StrokeStyle` with the default border width applied.
    public static var `default`: StrokeStyle {
        .init(lineWidth: Border.default.value)
    }
    
    /// 2px border
    /// A `StrokeStyle` with the emphasis border width applied.
    public static var emphasis: StrokeStyle {
        .init(lineWidth: Border.emphasis.value)
    }
    
    /// 4px border
    /// A `StrokeStyle` with the large border width applied.
    public static var large: StrokeStyle {
        .init(lineWidth: Border.large.value)
    }
}
