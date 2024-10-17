#if canImport(UIKit)

import UIKit
public typealias PlatformImage = UIImage

#elseif canImport(AppKit)

import AppKit
public typealias PlatformImage = NSImage

#endif

import SwiftUI

extension ImageResource {
    public var platformImage: PlatformImage? {
#if canImport(UIKit)
        return uiImage
#elseif canImport(AppKit)
        return nsImage
#endif
    }
}

