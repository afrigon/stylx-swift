import SwiftUI

@MainActor
public class FontRegister {
    public static let shared: FontRegister = .init()
    
    private var registered: Set<String> = .init()
    
    public func register(bundle: Bundle = .main, fontName: String, fontExtension: String = "ttf") {
        if registered.contains(fontName) {
            return
        }
        
        var error: Unmanaged<CFError>?
        let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension)
        
        guard let fontURL, CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error) else {
            print("Couldn't create font from: \(fontName).\(fontExtension)")
            return
        }
        
        registered.insert(fontName)
    }
}
