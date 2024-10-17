#if canImport(UIKit)

import UIKit
public typealias PlatformImage = UIImage

#elseif canImport(AppKit)

import AppKit
public typealias PlatformImage = NSImage

#endif

import SwiftUI

extension Image {
    public init(platformImage: PlatformImage) {
#if canImport(UIKit)
        self = Image(uiImage: platformImage)
#elseif canImport(AppKit)
        self = Image(nsImage: platformImage)
#endif
    }
}

extension ImageResource {
    public var platformImage: PlatformImage? {
#if canImport(UIKit)
        return uiImage
#elseif canImport(AppKit)
        return nsImage
#endif
    }
}

