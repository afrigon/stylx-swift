import Foundation

extension CGFloat {
    
    /// Values used for border width.
    public class border {
        
        /// 1px border
        /// The 1 px border is the most common and is used for dividers and border on many different elements.
        public static var `default`: CGFloat = 1
        
        /// 2px border
        /// The 2 px border is used to emphasize weight and is used for sliders, medium divider, etc.
        public static var emphasis: CGFloat = 2
        
        /// 4px border
        /// The 4 px border is only used for large divider.
        public static var large: CGFloat = 4
    }
}
