//
//  AdMobBannerView.swift
//  MySwift
//
//  Created by Mac10 on 2025/05/25.
//

import UIKit
import SwiftUI
import GoogleMobileAds

extension View{
    @ViewBuilder public func makeAdMobBanner(client: AdMobClient, adUnitID: String, wantToClose: @escaping () -> Void) -> some View {
        if !client.activeSubscription {
            HStack {
                let size = AdMobBannerView.getAdBannerSize()
                Spacer()
                AdMobBannerView(client: client,adUnitID: adUnitID)
                    .frame(width: size.size.width, height: size.size.height)
                Spacer()
            }.modifier(makeAdBannerOverlayModifier(wantToClose: wantToClose))
        } else {
            EmptyView()
        }
    }
}

struct AdMobBannerView: UIViewRepresentable {
    static let bannerSize = adSizeFor(cgSize: CGSize(width: 320, height: 50)) // kAdSizeBannerの代わり

    init(client:AdMobClient,adUnitID: String) {
        self.adUnitID = client.isReleaseAds ? adUnitID : client.testBannerID
    }

    let adUnitID: String
    @State private var banner: BannerView = .init(adSize: bannerSize)
    func makeUIView(context _: Context) -> BannerView {
        let bannerSize = AdMobBannerView.getAdBannerSize()
        banner.adSize = bannerSize
        banner.adUnitID = adUnitID
        banner.rootViewController = getPresentedViewController()
        banner.load(Request())
        return banner
    }

    func updateUIView(_: BannerView, context _: Context) {}

    static func getAdBannerSize() -> AdSize {
        if let rootView = UIApplication.shared.windows.first?.rootViewController?.view {
            let frame = rootView.frame.inset(by: rootView.safeAreaInsets)
            return currentOrientationAnchoredAdaptiveBanner(width: frame.width)
        }
        // No root VC, use 320x50 ad banner
        return bannerSize
    }
}

private struct makeAdBannerOverlayModifier: ViewModifier {
    let wantToClose: () -> Void
    func body(content: Content) -> some View {
        content.overlay(Button(action: wantToClose, label: {
            Image(systemName: "multiply").foregroundColor(Color(uiColor:UIColor.secondaryLabel)).frame(width: 30, height: 30)
        }).background(Color(uiColor: UIColor.systemBackground)).cornerRadius(15).offset(x: -10, y: -30), alignment: .topTrailing)
    }
}

