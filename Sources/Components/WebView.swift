#if canImport(WebKit)
import SwiftUI
import WebKit

#if canImport(UIKit)
public struct WebView: UIViewRepresentable {
    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    public func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
#endif // canImport(UIKit)

#if canImport(AppKit)
public struct WebView: NSViewRepresentable {
    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public func makeNSView(context: Context) -> WKWebView {
        WKWebView()
    }

    public func updateNSView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
#endif // canImport(AppKit)

#endif // canImport(WebKit)
