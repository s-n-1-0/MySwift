//
//  ProgressWebView.swift
//
//
//  Created by Mac10 on 2024/04/14.
//

import SwiftUI
import WebKit
public struct ProgressWebView: View {
    public let url: URL
    public let progressStyle:ProgressViewStyleType
    @State private var loadingProgress: Double = 0.0
    public var body: some View {
        WebView(
            url: url,
            loadingProgress: $loadingProgress
        ).modifier(ProgressModifier(loadingProgress: loadingProgress, progressStyle: progressStyle))
    }
}

fileprivate struct ProgressModifier:ViewModifier{
    let loadingProgress:Double
    let progressStyle:ProgressViewStyleType
    func body(content: Content) -> some View {
        
        switch(progressStyle){
        case .linear:
            ZStack(alignment: .top) {
                content
                if loadingProgress < 1{
                    ProgressView(value: loadingProgress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle())
                }
            }
        case .circle:
            ZStack(alignment: .center) {
                content
                if loadingProgress < 1{
                    ProgressView().progressViewStyle(CircularProgressViewStyle()).scaleEffect(1.5)
                }
            }
        }
    }
}

public enum ProgressViewStyleType{
    case linear
    case circle
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
                Task{
                    @MainActor in
                    parent.loadingProgress = value.newValue ?? 0
                }
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
    ProgressWebView(url: URL(string: "https://google.com")!, progressStyle: .circle)
}
