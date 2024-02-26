import SwiftUI

public struct ThemedColor {
    private let light: Color
    private let dark: Color
    private let lightIncreasedContrast: Color
    private let darkIncreasedContrast: Color
    
    public init(
        light: ColorIdentifier,
        dark: ColorIdentifier? = nil,
        lightIncreasedContrast: ColorIdentifier? = nil,
        darkIncreasedContrast: ColorIdentifier? = nil
    ) {
        let darkIdentifier = dark ?? light.inverse()
        
        self.light = light.color
        self.dark = darkIdentifier.color
        self.lightIncreasedContrast = (lightIncreasedContrast ?? light.darker()).color
        self.darkIncreasedContrast = (darkIncreasedContrast ?? darkIdentifier.lighter()).color
    }
    
    public init(
        light: Color,
        dark: Color,
        lightIncreasedContrast: Color? = nil,
        darkIncreasedContrast: Color? = nil
    ) {
        self.light = light
        self.dark = dark
        self.lightIncreasedContrast = lightIncreasedContrast ?? light
        self.darkIncreasedContrast = darkIncreasedContrast ?? dark
    }
    
    func color(scheme: ColorScheme, contrast: ColorSchemeContrast) -> Color {
        switch contrast {
            case .standard:
                switch scheme {
                    case .light:
                        light
                    case .dark:
                        dark
                    @unknown default:
                        light
                }
            case .increased:
                switch scheme {
                    case .light:
                        lightIncreasedContrast
                    case .dark:
                        darkIncreasedContrast
                    @unknown default:
                        lightIncreasedContrast
                }
            @unknown default:
                switch scheme {
                    case .light:
                        light
                    case .dark:
                        dark
                    @unknown default:
                        light
                }
        }
    }
}
