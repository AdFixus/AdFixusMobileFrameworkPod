//
//  ResponsiveAdController.swift
//  AdFixusMobileFrameworkTest
//
//  Created by AdFixus Pty Ltd on 25/5/2022.
//

import GoogleMobileAds
import UIKit
import AdFixusMobileFramework

class ResponsiveAdController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var adContainerView: UIView!
    private var manager: ResponsiveAdManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = ResponsiveAdManager()
        adContainerView.layer.borderWidth = 2;
        adContainerView.layer.borderColor = UIColor.red.cgColor
        
        let operationResponse = loadWithParameters()
        //let operationResponse = loadWithRequest()
        
        print("       AFX SDK Log Message: operationResponse \(String(describing: operationResponse))")
    }
    
    func loadWithParameters() -> OperationResponse
    {
        var adSizes = [NSValue]()
        let adUnitID = "/21842759191/carsales.ios/used/results"
        //let adUnitID = "/21842759191/carsales.ios/used/resultssmart"
        
        let size = CGSize(width: 360, height: 500)
        let richMediaSize = GADAdSizeFromCGSize(size)
        let mrec = GADAdSizeFromCGSize(CGSize(width: 300, height: 250))
        adSizes.append(NSValueFromGADAdSize(richMediaSize))
        adSizes.append(NSValueFromGADAdSize(mrec))
        
        var customTargeting = Dictionary<String, String>()
        customTargeting["kw"] = "mobilefirst"
        
        // MANAGEMENT OF EVENTS
        let operationResponse = manager.loadResponsiveAd(self, adContainerUIView: adContainerView, initialSize: size, adSizes: adSizes, adUnitID: adUnitID, customTargeting: &customTargeting, publisherProvidedID: nil ,delegate: nil)
        
        // AUTO MANAGED EVENTS
        //let operationResponse = manager.loadResponsiveAd(self, adContainerUIView: adContainerView, initialSize: size, adSizes: adSizes, adUnitID: adUnitID, customTargeting: &customTargeting, publisherProvidedID: nil, delegate: nil)
        
        return operationResponse
    }
    
    func loadWithRequest() -> OperationResponse
    {
        var adSizes = [NSValue]()
        let adUnitID = "/21842759191/carsales.ios/used/results"
        //let adUnitID = "/21842759191/carsales.ios/used/resultssmart"
        
        let size = CGSize(width: 360, height: 500)
        let richMediaSize = GADAdSizeFromCGSize(size)
        let mrec = GADAdSizeFromCGSize(CGSize(width: 300, height: 250))
        adSizes.append(NSValueFromGADAdSize(richMediaSize))
        adSizes.append(NSValueFromGADAdSize(mrec))
        
        var customTargeting = Dictionary<String, String>()
        customTargeting["kw"] = "mobilefirst"
        
        let request = GAMRequest()
        request.customTargeting = customTargeting
        
        // MANAGEMENT OF EVENTS
        let operationResponse = manager.loadResponsiveAd(self, adContainerUIView: adContainerView, request: request, initialSize: size, adSizes: adSizes, adUnitID: adUnitID, delegate: self)
        
        // AUTO MANAGED EVENTS
        //let operationResponse = manager.loadResponsiveAd(self, adContainerUIView: adContainerView, request: request, initialSize: size, adSizes: adSizes, adUnitID: adUnitID, delegate: nil)
        
        return operationResponse
        
    }
    
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("       AFX SDK Log Message: bannerViewDidReceiveAd (PARENT)")
    }
    
    // Called when an ad request failed.
    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        print("       AFX SDK Log Message: GADBannerViewDelegate (PARENT): \(error)")
    }
    
    // Called just before presenting the user a full screen view, such as a browser, in response to
    // clicking on an ad.
    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("       AFX SDK Log Message: bannerViewWillPresentScreen (PARENT)")
    }
     
    // Called just before dismissing a full screen view.
    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("       AFX SDK Log Message: bannerViewWillDismissScreen (PARENT)")
    }
    
    // Called just after dismissing a full screen view.
    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("       AFX SDK Log Message: bannerViewDidDismissScreen (PARENT)")
    }
}
