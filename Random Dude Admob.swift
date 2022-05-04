//
//  Insterstitial.swift
//
//
//  Created by Gweppi on 23/08/2021.
//

import GoogleMobileAds

class InterstitialAd: NSObject, GADFullScreenContentDelegate, ObservableObject {
    
    private static var interstitial: GADInterstitialAd?

    static func loadAd(completion: (() -> Void)? = nil) {
        let request = GADRequest()
        request.scene = UIApplication.shared.connectedScenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene
        GADInterstitialAd.load(withAdUnitID: "AdUnitID", request: request, completionHandler: { [self] ad, error in
            guard error == nil else { return }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
            if let completion = completion {
              completion
            }
        })
    }
    
    static func showAd() {
        guard interstitial != nil else { return }
//      This is how I present the add, an interstitial is a view itself. 
        interstitial?.present(fromRootViewController: UIApplication.keyWindow)
    }
    
    private static func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        interstitial = nil
        loadAd()
    }
}

extension UIApplication {
    
    var keyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
}
