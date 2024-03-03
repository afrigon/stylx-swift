import SwiftUI

extension Color {
    public init(hex: UInt32, useAlpha: Bool = false) {
        let second = Double(hex >> 16 & 0xff) / 255
        let third = Double(hex >> 8 & 0xff) / 255
        let fourth = Double(hex & 0xff) / 255
        
        if useAlpha {
            let first = Double(hex >> 24 & 0xff) / 255
            
            self.init(red: first, green: second, blue: third, opacity: fourth)
        } else {
            self.init(red: second, green: third, blue: fourth)
        }
    }
}
