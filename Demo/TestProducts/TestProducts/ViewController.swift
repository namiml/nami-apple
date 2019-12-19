//
//  ViewController.swift
//  TestProducts
//
//  Created by Kendall Gelner on 6/21/19.
//  Copyright © 2019 Nami ML, Inc. All rights reserved.
//

import UIKit
import Nami

// A handy set of the possible subscription product identifiers, if any of these have been purchased it means a subscription is active.
let subscriptionProducts = ["test_product_yearly_subscription", "test_product_sixmonth_subscription", "test_product_monthly_subscription"]

class ViewController: UIViewController {

    
    @IBOutlet weak var subscribeButton: UIButton?

    @IBOutlet weak var subscriptionActiveLabel: UILabel?
    
    //MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NamiStoreKitHelper.shared.register { [weak self] (purchases, purchaseState, error) in
            // Any time purchases change, we'll have it update the UI.
            if purchaseState != .pending {
                self?.configureSubscriptionButtons()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Update the UI with whatever the current purchase status is.
        configureSubscriptionButtons()
    }
    
    private func configureSubscriptionButtons() {
        
        // We'll check all of the subscription products to see if any have been purchased, using the set of known product identifiers.

        if NamiStoreKitHelper.shared.anyProductPurchased(subscriptionProducts) {
            // One of the subscription products has been purchased, indicate the subscription is live and the button to subscribe can be used to change the subscription period.
            subscribeButton?.setTitle("Change Subscription", for: .normal)
            subscriptionActiveLabel?.text = "Active"
            subscriptionActiveLabel?.textColor = .green
        } else {
             // No subscription is active, show that subscription is off.
            subscribeButton?.setTitle("Subscribe", for: .normal)
            subscriptionActiveLabel?.text = "Inactive"
            subscriptionActiveLabel?.textColor = .red
        }
    }

    //MARK: Actions
    
    @IBAction func subscribeTapped(_ sender: Any) {
        // Tell Nami to raise whatever the current live subscription paywall may be, so the user can select an option.
        NamiPaywallManager.shared.raisePaywall(fromVC: self)
    }
    
    
    
   
}

