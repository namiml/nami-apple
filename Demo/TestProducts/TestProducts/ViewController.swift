//
//  ViewController.swift
//  TestProducts
//
//  Created by Kendall Gelner on 6/21/19.
//  Copyright © 2019 Nami ML, Inc. All rights reserved.
//

import UIKit
import Nami

class ViewController: UIViewController {

    
    @IBOutlet weak var subscribeButton: UIButton?

    @IBOutlet weak var subscriptionActiveLabel: UILabel?
    
    //MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This callback will be used by the Nami SDK whenever entititlements change - we have
        // three subscription products configured in Nami to activate a single entitlement.
        NamiEntitlementManager.registerEntitlementsChangedHandler { [weak self] (entitlementsChanged) in
            self?.configureSubscriptionButtons()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Update the UI with whatever the current purchase status is.
        configureSubscriptionButtons()
    }
    
    private func configureSubscriptionButtons() {
        
        // We have three seperate subscription products for this application, all of them are registered in the Nami
        // Control Center to actiavte the following entitlement, so a purchase for any term will activate this.
        let isPurchased = NamiEntitlementManager.isEntitlementActive("TestProductSubscription")

        if isPurchased {
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
        NamiPaywallManager.raisePaywall(fromVC: self)
    }
    
    
    
   
}

