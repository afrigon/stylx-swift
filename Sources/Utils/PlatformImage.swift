#if canImport(UIKit)

import UIKit
public typealias PlatformImage = UIImage

#elseif canImport(AppKit)

import AppKit
public typealias PlatformImage = NSImage

#endif

import SwiftUI

extension Image {

    @MainActor
    public init(data: Data) {
        self = Image(platformImage: PlatformImage(data: data) ?? PlatformImage())
    }

    @MainActor
    public init(platformImage: PlatformImage) {
#if canImport(UIKit)
        self = Image(uiImage: platformImage)
#elseif canImport(AppKit)
        self = Image(nsImage: platformImage)
#endif
    }
}

extension ImageRenderer {

    @MainActor
    public var platformImage: PlatformImage? {
#if canImport(UIKit)
        return uiImage
#elseif canImport(AppKit)
        return nsImage
#endif
    }
}

#if canImport(AppKit)
extension NSImage {

    @MainActor
    public func data() -> Data? {
        tiffRepresentation
    }
}
#endif

#if canImport(UIKit)
extension UIImage {

    @MainActor
    public func data() -> Data? {
        pngData()
    }
}
#endif

extension Data {

    @MainActor
    public init?(image: ImageResource) {
        guard let data = PlatformImage(resource: image).data() else {
            return nil
        }

        self = data
    }
}

