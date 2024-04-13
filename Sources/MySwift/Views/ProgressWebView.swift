//
//  ProgressWebView.swift
//
//
//  Created by Mac10 on 2024/04/14.
//

import SwiftUI
import WebKit
struct ProgressWebView: View {
    let url: URL
    @State private var loadingProgress: Double = 0.0
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                WebView(
                    url: url,
                    loadingProgress: $loadingProgress
                )
            }
            if loadingProgress > 0  && loadingProgress < 1{
                ProgressView(value: loadingProgress, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle())
            }
        }
    }
}

//ref https://qiita.com/kamimi01/items/33446e032822518cb7f7
fileprivate struct WebView: UIViewRepresentable {
    private let webView = WKWebView()
    
    let url: URL
    @Binding var loadingProgress: Double
    
    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    static func dismantleUIView(_ uiView: WKWebView, coordinator: Coordinator) {
        coordinator.observations.removeAll()
    }
}

extension WebView {
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var observations: [NSKeyValueObservation] = []
        
        init(_ parent: WebView) {
            self.parent = parent
            let progressObservation = parent.webView.observe(\.estimatedProgress, options: .new, changeHandler: { _, value in
                parent.loadingProgress = value.newValue ?? 0
            })
            observations = [
                progressObservation
            ]
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        }
    }
}

#Preview {
    ProgressWebView(url: URL(string: "https://hello.sn-10.net")!)
}
