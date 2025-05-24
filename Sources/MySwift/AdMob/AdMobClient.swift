//
//  AdMobClient.swift
//
//  Created by Mac10 on 2025/05/25.
//  Copyright © 2025 Mac10. All rights reserved.
//

import GoogleMobileAds

public class AdMobClient {
    // 上書きして使用する。本番広告を表示する条件を満たしているならtrueを返す
    public var isReleaseAds: Bool {
        false
    }

    // 上書きして使用する。課金等で広告非表示になっている場合はtrueを返す
    public var activeSubscription: Bool {
        false
    }

    // Test ID
    let testRewardID = "ca-app-pub-3940256099942544/1712485313"
    let testBannerID = "ca-app-pub-3940256099942544/2934735716"
    let testInterstitialID = "ca-app-pub-3940256099942544/4411468910"
}
