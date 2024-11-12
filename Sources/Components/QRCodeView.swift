import SwiftUI
import CoreImage.CIFilterBuiltins

public struct QRCodeView: View {
#if canImport(UIKit)
    typealias NativeImage = UIImage
#endif

#if canImport(AppKit)
    typealias NativeImage = NSImage
#endif

    @State private var image: NativeImage?

    private let data: Data

    public init(_ data: Data) {
        self.data = data
    }

    public init?(_ data: String) {
        guard let data = data.data(using: .utf8) else {
            return nil
        }

        self.data = data
    }

    public init?(_ data: URL) {
        guard let data = data.absoluteString.data(using: .utf8) else {
            return nil
        }

        self.data = data
    }

    private var nativeImage: Image? {
        guard let image else {
            return nil
        }

#if canImport(UIKit)
        return Image(uiImage: image)
#endif

#if canImport(AppKit)
        return Image(nsImage: image)
#endif
    }

    public var body: some View {
        GeometryReader { geometry in
            Color.clear
                .overlay {
                    nativeImage?
                        .resizable()
                        .interpolation(.none)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .aspectRatio(contentMode: .fit)
                }
                .onAppear {
                    let context = CIContext()
                    let filter = CIFilter.qrCodeGenerator()

                    filter.message = data

                    guard let outputImage = filter.outputImage,
                        let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
                        return
                    }

#if canImport(UIKit)
                    image = UIImage(cgImage: cgImage)
#endif

#if canImport(AppKit)
                    image = NSImage(cgImage: cgImage, size: outputImage.extent.size)
#endif
                }
        }
    }
}
