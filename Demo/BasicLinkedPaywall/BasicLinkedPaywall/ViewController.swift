//
//  ViewController.swift
//  BasicLinkedPaywall
//
//  Created by Kendall Gelner on 5/25/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
//

import UIKit
import Nami

class ViewController: UIViewController {

    @IBOutlet weak var subscriptionActiveLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Have Nami tell us whenever entitlements changed - whenever puchases are made, they affect an entitlement that represents one or more product purcahses.
        NamiEntitlementManager.registerChangeHandler() { [weak self] (entitlementsChanged) in
            self?.configureSubscriptionButtons()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Update the UI with whatever the current purchase status is.
        configureSubscriptionButtons()
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.raisePaywallInViewController = self
        }
    }
    
    private func configureSubscriptionButtons() {
        
        // We have three seperate subscription products for this application, all of them are registered in the Nami
        // Control Center to actiavte the following entitlement, so a purchase for any term will activate this.
        let isPurchased = NamiEntitlementManager.isEntitlementActive("default_entitlement")

        print("\(isPurchased), \(String(describing: NamiEntitlementManager.active().first?.referenceId))")
        
        if isPurchased {
            // One of the subscription products has been purchased, indicate the subscription is live and the button to subscribe can be used to change the subscription period.
            subscriptionActiveLabel?.text = "Active"
            subscriptionActiveLabel?.textColor = .green
        } else {
             // No subscription is active, show that subscription is off.
            subscriptionActiveLabel?.text = "Inactive"
            subscriptionActiveLabel?.textColor = .red
        }
    }
    
    @IBAction func primaryPaywallPressed(_ sender: Any) {
        NamiCampaignManager.launch(label: "PrimaryLinked")
    }
    
    @IBAction func alternatePaywallPressed(_ sender: Any) {
        NamiCampaignManager.launch(label: "AlternateLinked")
    }
    
}

