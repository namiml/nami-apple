//
//  ContentView.swift
//  NamiColorsSWUI
//
//  Created by Kendall Gelner on 1/20/21.
//  Copyright © 2021 Nami ML Inc. All rights reserved.
//

import Nami
import SwiftUI

struct ResultView: View {
    var choice: String

    var body: some View {
        Text("You chose \(choice)")
    }
}

struct ContentView: View {
    @EnvironmentObject var namiDataSource: NamiDataSource

    @State private var username: String = ""

    /// Login a user with the given accountID - a UUID willl be generated for this user, since Nami only acccepts a UUID or SHA256 hash as an account identifier.
    func loginWithAccountID(accountID: String?) {
        if let accountID = accountID, !accountID.isEmpty {
            NamiCustomerManager.login(withId: UUID().uuidString) { success, _ in

                if success {
                    UserDefaults.standard.set(accountID, forKey: "accountID")
                }
            }
        }
    }

    /// Returns any current accountID saved
    func currentAccountID() -> String? {
        return UserDefaults.standard.string(forKey: "accountID")
    }

    /// Clears out any saved account ID.
    func clearStoredAccountID() {
        UserDefaults.standard.removeObject(forKey: "accountID")
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer()
                if namiDataSource.loggedIn {
                    if #available(iOS 15.0, *) {
                        Text("Logged in as \(currentAccountID() ?? "")")
                            .padding([.leading, .trailing, .top, .bottom], 10)
                            .border(.secondary)
                            .padding([.leading, .trailing], 20)
                    }
                    Button {
                        NamiCustomerManager.logout { _, _ in
                            clearStoredAccountID()
                        }
                    } label: {
                        Text("Logout")
                    }
                } else {
                    if #available(iOS 15.0, *) {
                        TextField("Username", text: $username)
                            .padding([.leading, .trailing, .top, .bottom], 10)
                            .onSubmit {
                                loginWithAccountID(accountID: username)
                            }
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .border(.secondary)
                            .padding([.leading, .trailing], 20)
                    } else {
                        TextField("Username", text: $username).disableAutocorrection(true)
                    }
                    Button {
                        loginWithAccountID(accountID: username)
                    } label: {
                        Text("Login")
                    }
                }

                Spacer()

                Text("Choose type of purchase to demo:")
                    .padding()

                NavigationLink(destination: SubscriptionColor()) {
                    Text("Subscription")
                }

                NavigationLink(destination: OneTimePaymentColor()) {
                    Text("One-Time Purchase")
                }

                NavigationLink(destination: MultiPaymentColor()) {
                    Text("Multi-Purchase (consumable)")
                }
                Spacer()
            }
        }
    }

    init() {
        username = currentAccountID() ?? ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
