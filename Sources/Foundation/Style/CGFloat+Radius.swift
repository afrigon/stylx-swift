import Foundation

extension CGFloat {
    
    /// Values used for corner radius.
    public class radius {
        
        /// 4px radius
        /// This is the radius used in most of the components.
        public static let `default`: CGFloat = 4
        
        /// 8px radius
        /// This is the radius used on larger elements like cards.
        public static let double: CGFloat = 8
        
        /// Full radius
        /// This is the radius to use for perfectly rounded element like a profile picture.
        public static let full: CGFloat = .infinity
        
        /// 1px border radius
        /// Default border radius will match the width of the border allowing to have the inside of the border perfectly square and the outside perfectly rounded.
        public static let borderDefault: CGFloat = 1
        
        /// 2px border radius
        /// Default border radius will match the width of the border allowing to have the inside of the border perfectly square and the outside perfectly rounded.
        public static let borderEmphasis: CGFloat = 2
        
        /// 4px border radius
        /// Default border radius will match the width of the border allowing to have the inside of the border perfectly square and the outside perfectly rounded.
        public static let borderLarge: CGFloat = 4
    }
}
