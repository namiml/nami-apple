//
// CollectionViewPaywallViewController.swift
//  BasicLinkedPaywall
//
//  Created by Kendall Gelner on 5/17/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
//

import Foundation
import UIKit
import Nami

class CollectionViewPaywallViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    public var products: [NamiSKU]?
    public var namiPaywall: NamiPaywall?
    
    var backgroundImage: UIImage?
  
    @IBOutlet weak var backgroundImageView: UIImageView?
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var bodyLabel: UILabel?
    @IBOutlet weak var purchaseTermsTextView: UITextView?
    
    @IBOutlet weak var productCollectionView: UICollectionView?
    
    func populatePaywall() {
        // Use data defined in the Nami Control Center to popualte our paywall.
        self.backgroundImageView?.image = namiPaywall?.backgroundImage
        self.titleLabel?.text = namiPaywall?.title
        self.bodyLabel?.text = namiPaywall?.body
        self.purchaseTermsTextView?.text = namiPaywall?.purchaseTerms
        
        // Use style data also defined in the Nami Control Center to adjust our paywall text and background colors.
        if let styleData = namiPaywall?.styleData {
            self.view.backgroundColor = styleData.backgroundColor
            self.productCollectionView?.backgroundColor = styleData.backgroundColor
            self.titleLabel?.textColor = styleData.titleTextColor
            self.bodyLabel?.textColor = styleData.bodyTextColor
            self.purchaseTermsTextView?.backgroundColor =  styleData.purchaseTermsTextColor
            self.purchaseTermsTextView?.backgroundColor = styleData.backgroundColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // With the view loaded, we'll rely on Nami paywall metadata passed in before the view is loaded to fill in details for presentation.
        populatePaywall()
    }
    
    
    
    @IBAction func restorePurchasesPressed(_ sender: Any) {
    }
    
    @IBAction func termsConditionsPressed(_ sender: Any) {
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
        }
    }

}

let reuseIdentifier = "ProductCell"

// MARK: - UICollectionViewDataSource/Delegate
extension CollectionViewPaywallViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell (
            withReuseIdentifier: reuseIdentifier,
            for: indexPath)
        if let product = products?[indexPath.item],
           let productCell = cell as? ProductCell {
            // We'll use Smart Text for these cells to construct a custom cell with product components placed where we like.
            productCell.durationLabel?.text = NamiPaywallManager.processSmartText(text: "${sku.duration}", dataStores: [product])
            productCell.priceLabel?.text = NamiPaywallManager.processSmartText(text: "${sku.price}", dataStores: [product])
            
            // Style the product info according to values defined in the Nami Control Center.
            if let styleData = namiPaywall?.styleData {
                productCell.backgroundColor = styleData.skuButtonColor
                productCell.durationLabel?.textColor = styleData.skuButtonTextColor
                productCell.priceLabel?.textColor = styleData.skuButtonTextColor
            }
            // Configure the cell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let product = products?[indexPath.item] {
            NamiPurchaseManager.buySKU(product, fromPaywall: namiPaywall) { purchase, purchaseState, error in
                if purchaseState == .purchased {
                    let alert = UIAlertController(title: "Purchase Success", message: "Your purchase is complete!", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                        alert.dismiss(animated: true) {
                            self.dismiss(animated: true) {
                            }
                        }
                    } ))
                    self.present(alert, animated: true) {
                    }
                }
            }
        }
    }
    
}
