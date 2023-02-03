//
//  EntitlementsView.swift
//  Test
//
//  Created by Dan Burcaw on 10/24/22.
//

import SwiftUI
import NamiApple

struct EntitlementsView: View {
    @EnvironmentObject var namiDataSource: NamiDataSource

    var body: some View {

        ZStack {

            Form {

                Section(header: Text(namiDataSource.activeEntitlements.count > 0 ? "Active Entitlements" : "No Active Entitlements")) {
                    ForEach(namiDataSource.activeEntitlements, id: \.self) { activeEntitlement in
                        Text(activeEntitlement.referenceId)
                    }
                }
            }
        }
        .navigationBarTitle("Entitlements")
        .toolbar {
            Button("Refresh") {
                NamiEntitlementManager.refresh()
            }
        }
    }
}

struct EntitlementsViewView_Previews: PreviewProvider {
    static var previews: some View {
        EntitlementsView()
    }
}
