//
//  ResponsiveAdController.swift
//  AdFixusMobileFrameworkTest
//
//  Created by AdFixus Pty Ltd on 25/5/2022.
//

import GoogleMobileAds
import UIKit
import AdFixusMobileFramework

class ResponsiveAdController: UIViewController, GADBannerViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate  {
       
    @IBOutlet weak var collectionView: UICollectionView!
    private var manager: ResponsiveAdManager!
    private var adSlotId: Int = 1
    private var bannerView: GAMBannerView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("collectionView: 10")
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("collectionView: cell: \(indexPath.row ) ")

        var cell: UICollectionViewCell
               
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListingCell", for: indexPath)
        cell.backgroundColor = UIColor.white
        
        if indexPath.row % 2 == 0 {
            
            if indexPath.row == 0 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListingCell", for: indexPath)
                cell.backgroundColor = UIColor.white
                
                for subview in cell.subviews {
                    subview.removeFromSuperview()
                }
                
                var adSizes = [NSValue]()
                let adUnitID = "/21842759191/carsales.ios/used/results"
                
                let size = CGSize(width: 360, height: 500)
                let richMediaSize = GADAdSizeFromCGSize(size)
                let mrec = GADAdSizeFromCGSize(CGSize(width: 300, height: 250))
                adSizes.append(NSValueFromGADAdSize(richMediaSize))
                adSizes.append(NSValueFromGADAdSize(mrec))
                
                bannerView = GAMBannerView(adSize: GADAdSizeFromCGSize(size))
                bannerView.validAdSizes = adSizes
                bannerView.adUnitID = adUnitID
                
                bannerView.rootViewController = self
                bannerView.delegate = self
                
                var targeting = Dictionary<String, String>()
                targeting["kw"] = "mobilefirst-mrec"
                
                let request = GAMRequest()
                request.customTargeting = targeting
                bannerView.load(request)
                bannerView.translatesAutoresizingMaskIntoConstraints = false
                cell.addSubview(bannerView)
                bannerView.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
                bannerView.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            }
            else {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListingCell", for: indexPath)
                cell.backgroundColor = UIColor.white
            }
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdCell", for: indexPath)
            cell.backgroundColor = UIColor.white

            for subview in cell.subviews {
                subview.removeFromSuperview()
            }
            
            var targeting = Dictionary<String, String>()
            
            switch (adSlotId)  {
              case 1:
                targeting["cct"] = "contentcard"
              case 2:
                targeting["cct"] = "gc"
            case 3:
                targeting["cct"] = "carsalescard"
              default:
                targeting["cct"] = "mrec"
            }
            
            adSlotId += 1
            _ = loadAdWithParameters(adView: cell, targeting: &targeting)
        }

        return cell
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("==GESTURE==")
        
        if (gestureRecognizer is UILongPressGestureRecognizer) {
            print("==GESTURE==")
        }

        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = ResponsiveAdManager()
        collectionView.delegate = self
        collectionView.dataSource = self

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width , height: 500)

        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        collectionView.collectionViewLayout = layout
        collectionView.dragInteractionEnabled = false
    }
    
    func loadAdWithParameters(adView: UIView, targeting: inout Dictionary<String, String>) -> OperationResponse
    {
        var adSizes = [NSValue]()
        let adUnitID = "/21842759191/carsales.ios/used/results"
        //let adUnitID = "/21842759191/carsales.ios/used/resultssmart"
        
        let size = CGSize(width: 360, height: 500)
        let richMediaSize = GADAdSizeFromCGSize(size)
        let mrec = GADAdSizeFromCGSize(CGSize(width: 300, height: 250))
        adSizes.append(NSValueFromGADAdSize(richMediaSize))
        adSizes.append(NSValueFromGADAdSize(mrec))
        
        // MANAGEMENT OF EVENTS
        //let operationResponse = manager.loadResponsiveAd(self, adContainerUIView: adView, initialSize: size, adSizes: adSizes, adUnitID: adUnitID, customTargeting: &targeting, publisherProvidedID: nil ,delegate: self)
        
        // AUTO MANAGED EVENTS
        let operationResponse = manager.loadResponsiveAd(self, adContainerUIView: adView, initialSize: size, adSizes: adSizes, adUnitID: adUnitID, customTargeting: &targeting, publisherProvidedID: nil, delegate: nil)
        
        return operationResponse
    }
    
    func loadWithRequest(adView: UIView, targeting: inout Dictionary<String, String>) -> OperationResponse
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
        //let operationResponse = manager.loadResponsiveAd(self, adContainerUIView: adView, request: request, initialSize: size, adSizes: adSizes, adUnitID: adUnitID, delegate: self)
        
        // AUTO MANAGED EVENTS
        let operationResponse = manager.loadResponsiveAd(self, adContainerUIView: adView, initialSize: size, adSizes: adSizes, adUnitID: adUnitID, customTargeting: &targeting, publisherProvidedID: nil, delegate: nil)
        
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
