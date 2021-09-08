//
//  SimplePaywallViewController.swift
//  BasicLinkedPaywall
//
//  Created by Kendall Gelner on 5/17/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
//

import Foundation
import UIKit
import Nami

class SimplePaywallViewController: UIViewController {
    public var products: [NamiSKU]?
    public var namiPaywall: NamiPaywall?
    
    @IBOutlet weak var backgroundImageView: UIImageView?
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var bodyLabel: UILabel?
    
    @IBOutlet weak var monthyButton: UIButton?
    @IBOutlet weak var yearlyButton: UIButton?
    
    func populatePaywall() {
        // Use data defined in the Nami Control Center to popualte our paywall.
        self.backgroundImageView?.image = namiPaywall?.backgroundImage
        self.titleLabel?.text = namiPaywall?.title
        self.bodyLabel?.text = namiPaywall?.body
        
        // Set up monthly button directly from monthly product, using a custom label we defined in Nami Control Center for this product.
        if let monthlyProduct = productForProductID("test_product_linked_monthly_subscription") {
            let titleString = monthlyProduct.namiDisplayText
            monthyButton?.setTitle(titleString, for: .normal)
        }
        
        // Set up yearly button directly from yearly product, using a custom label we defined in Nami Control Center for this product.
        if let yearlyProduct = productForProductID("test_product_linked_yearly_subscription") {
            let titleString = yearlyProduct.namiDisplayText
            yearlyButton?.setTitle(titleString, for: .normal)
        }
        
        // Use style data also defined in the Nami Control Center to adjust our paywall text and background colors.
        if let styleData = namiPaywall?.styleData {
            self.view.backgroundColor = styleData.backgroundColor
            self.titleLabel?.textColor = styleData.titleTextColor
            self.bodyLabel?.textColor = styleData.bodyTextColor
        }
    }

    func productForProductID( _ produdtID: String ) -> NamiSKU? {
        if let products = products {
            for product in products {
                if product.skuID == produdtID {
                    return product
                }
            }
        }
        return .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populatePaywall()
    }
    
    @IBAction func buyMonthlyPressed(_ sender: Any) {
        if let monthlyProduct = productForProductID("test_product_linked_monthly_subscription") {
            buyProductForNamiSKU(sku: monthlyProduct)
        }
    }
    
    @IBAction func buyYearlyPressed(_ sender: Any) {
        if let monthlyProduct = productForProductID("test_product_linked_yearly_subscription") {
            buyProductForNamiSKU(sku: monthlyProduct)
        }
    }
    
    @IBAction func restorePurchasesPressed(_ sender: Any) {
    }
    
    @IBAction func termsConditionsPressed(_ sender: Any) {
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {            
        }
    }
    
    func buyProductForNamiSKU( sku: NamiSKU ) {
        NamiPurchaseManager.buySKU(sku, fromPaywall: namiPaywall) { purchase, purchaseState, error in
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
