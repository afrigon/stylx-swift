import Foundation

extension CGFloat {
    
    /// 1px spacing
    public static var xxxxs: CGFloat    = 1
    
    /// 2px spacing
    public static var xxxs: CGFloat     = 2
    
    /// 4px spacing
    public static var xxs: CGFloat      = 4
    
    /// 8px spacing
    public static var xs: CGFloat       = 8
    
    /// 12px spacing
    public static var s: CGFloat        = 12
    
    /// 16px spacing
    public static var m: CGFloat        = 16
    
    /// 24px spacing
    public static var l: CGFloat        = 24
    
    /// 32px spacing
    public static var xl: CGFloat       = 32
    
    /// 40p spacing
    public static var xxl: CGFloat      = 40
    
    /// 48px spacing
    public static var xxxl: CGFloat     = 48
    
    /// 64px spacing
    public static var xxxxl: CGFloat    = 64
    
    /// 80px spacing
    public static var xxxxxl: CGFloat   = 80

    /// 96px spacing
    public static var xxxxxxl: CGFloat   = 96

    /// 128px spacing
    public static var xxxxxxxl: CGFloat   = 128

    /// multiplatform spacing
    public init(
        _ value: CGFloat,
        iOS: CGFloat? = nil, 
        macOS: CGFloat? = nil, 
        macCatalyst: CGFloat? = nil, 
        tvOS: CGFloat? = nil, 
        watchOS: CGFloat? = nil, 
        visionOS: CGFloat? = nil
    ) {
        #if targetEnvironment(macCatalyst)
        self = macCatalyst ?? iOS ?? value
        #elseif os(iOS)
        self = iOS ?? value
        #elseif os(macOS)
        self = macOS ?? value
        #elseif os(tvOS)
        self = tvOS ?? value
        #elseif os(watchOS)
        self = watchOS ?? value
        #elseif os(visionOS)
        self = visionOS ?? value
        #endif    
    }
}
