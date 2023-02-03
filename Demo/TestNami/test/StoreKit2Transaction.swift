//
//  StoreKit2Transaction.swift
//  Test
//
//  Created by Dan Burcaw on 1/12/23.
//

import Foundation
import StoreKit

@available(iOS 15.0, *)
final class StoreKit2TransactionObserver {

    var updates: Task<Void, Never>? = nil

    init() {
        updates = newTransactionListenerTask()
    }

    deinit {
        // Cancel the update handling task when you deinitialize the class.
        updates?.cancel()
    }

    private func newTransactionListenerTask() -> Task<Void, Never> {
        Task(priority: .background) {
            for await verificationResult in Transaction.updates {
                self.handle(updatedTransaction: verificationResult)
            }
        }
    }

    private func handle(updatedTransaction verificationResult: VerificationResult<Transaction>) {
        guard case .verified(let transaction) = verificationResult else {
            // Ignore unverified transactions.
            return
        }

        Task {
            await transaction.finish()
        }

//        if let revocationDate = transaction.revocationDate {
//            // Remove access to the product identified by transaction.productID.
//            // Transaction.revocationReason provides details about
//            // the revoked transaction.
//            <#...#>
//        } else if let expirationDate = transaction.expirationDate,
//            expirationDate < Date() {
//            // Do nothing, this subscription is expired.
//            return
//        } else if transaction.isUpgraded {
//            // Do nothing, there is an active transaction
//            // for a higher level of service.
//            return
//        } else {
//            // Provide access to the product identified by
//            // transaction.productID.
//            <#...#>
//        }
    }

}
