//
//  Insterstitial.swift
//
//
//  Created by Jesper Dinger on 23/08/2021.
//

import GoogleMobileAds

class InterstitialAd: NSObject, GADFullScreenContentDelegate, ObservableObject {
    
    private static var interstitial: GADInterstitialAd?
    
    static func loadAd() {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: "AdUnitID", request: request, completionHandler: { [self] ad, error in
            guard error == nil else { return }
            interstitial = ad
        })
    }

    static func modifiedLoadAd(completion: (() -> Void)? = nil) {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: "AdUnitID", request: request, completionHandler: { [self] ad, error in
            guard error == nil else { return }
            interstitial = ad
            if let completion = completion {
              completion
            }
        })
    }
    
    static func showAd() {
        guard interstitial != nil else { return }
//      This is how I present the add, an interstitial is a view itself. 
        interstitial?.present(fromRootViewController: (UIApplication.shared.windows.first?.rootViewController!)!)
    }
    
    private static func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        interstitial = nil
        loadAd()
    }
}
