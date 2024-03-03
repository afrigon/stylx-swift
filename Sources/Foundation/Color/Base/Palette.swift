import SwiftUI

public struct Palette {
    private static let values: [ColorIdentifier: UInt32] = [
        .lime.value0: 0xEFFFD6,
        .lime.value1: 0xD3F1A7,
        .lime.value2: 0xB3DF72,
        .lime.value3: 0x94C748,
        .lime.value4: 0x82B536,
        .lime.value5: 0x6A9A23,
        .lime.value6: 0x5B7F24,
        .lime.value7: 0x4C6B1F,
        .lime.value8: 0x37471F,
        .lime.value9: 0x28311B,
        
        .red.value0: 0xFFECEB,
        .red.value1: 0xFFD5D2,
        .red.value2: 0xFD9891,
        .red.value3: 0xF87168,
        .red.value4: 0xF15B50,
        .red.value5: 0xE2483D,
        .red.value6: 0xC9372C,
        .red.value7: 0xAE2E24,
        .red.value8: 0x5D1F1A,
        .red.value9: 0x42221F,
        
        .orange.value0: 0xFFF3EB,
        .orange.value1: 0xFEDEC8,
        .orange.value2: 0xFEC195,
        .orange.value3: 0xFEA362,
        .orange.value4: 0xF38A3F,
        .orange.value5: 0xE56910,
        .orange.value6: 0xC25100,
        .orange.value7: 0xA54800,
        .orange.value8: 0x702E00,
        .orange.value9: 0x38291E,
        
        .yellow.value0: 0xFFF7D6,
        .yellow.value1: 0xF8E6A0,
        .yellow.value2: 0xF5CD47,
        .yellow.value3: 0xE2B203,
        .yellow.value4: 0xCF9F02,
        .yellow.value5: 0xB38600,
        .yellow.value6: 0x946F00,
        .yellow.value7: 0x7F5F01,
        .yellow.value8: 0x533F04,
        .yellow.value9: 0x332E1B,
        
        .green.value0: 0xDCFFF1,
        .green.value1: 0xBAF3DB,
        .green.value2: 0x7EE2B8,
        .green.value3: 0x4BCE97,
        .green.value4: 0x2ABB7F,
        .green.value5: 0x22A06B,
        .green.value6: 0x1F845A,
        .green.value7: 0x216E4E,
        .green.value8: 0x164B35,
        .green.value9: 0x1C3329,
        
        .teal.value0: 0xE7F9FF,
        .teal.value1: 0xC6EDFB,
        .teal.value2: 0x9DD9EE,
        .teal.value3: 0x6CC3E0,
        .teal.value4: 0x42B2D7,
        .teal.value5: 0x2898BD,
        .teal.value6: 0x227D9B,
        .teal.value7: 0x206A83,
        .teal.value8: 0x164555,
        .teal.value9: 0x1E3137,
        
        .blue.value0: 0xE9F2FF,
        .blue.value1: 0xCCE0FF,
        .blue.value2: 0x85B8FF,
        .blue.value3: 0x579DFF,
        .blue.value4: 0x388BFF,
        .blue.value5: 0x1D7AFC,
        .blue.value6: 0x0C66E4,
        .blue.value7: 0x0055CC,
        .blue.value8: 0x09326C,
        .blue.value9: 0x1C2B41,
        
        .purple.value0: 0xF3F0FF,
        .purple.value1: 0xDFD8FD,
        .purple.value2: 0xB8ACF6,
        .purple.value3: 0x9F8FEF,
        .purple.value4: 0x8F7EE7,
        .purple.value5: 0x8270DB,
        .purple.value6: 0x6E5DC6,
        .purple.value7: 0x5E4DB2,
        .purple.value8: 0x352C63,
        .purple.value9: 0x2B273F,
        
        .pink.value0: 0xFFECF8,
        .pink.value1: 0xFDD0EC,
        .pink.value2: 0xF797D2,
        .pink.value3: 0xE774BB,
        .pink.value4: 0xDA62AC,
        .pink.value5: 0xCD519D,
        .pink.value6: 0xAE4787,
        .pink.value7: 0x943D73,
        .pink.value8: 0x50253F,
        .pink.value9: 0x3D2232,
        
        .gray.value0: 0xFFFFFF,
        .gray.value1: 0xF8F8F8,
        .gray.value2: 0xE6E6E6,
        .gray.value3: 0xD5D5D5,
        .gray.value4: 0xB1B1B1,
        .gray.value5: 0x909090,
        .gray.value6: 0x6D6D6D,
        .gray.value7: 0x464646,
        .gray.value8: 0x222222,
        .gray.value9: 0x000000,
    ]
    
    public static func color(id: ColorIdentifier) -> Color {
        guard let value = values[id] else {
            return .white
        }
        
        return Color(hex: value)
    }
}    

#Preview {
    ColorScaleView(hue: .blue)
}
