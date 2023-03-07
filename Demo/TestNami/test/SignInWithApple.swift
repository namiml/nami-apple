//
//  SignInWithApple.swift
//  Test
//
//  Created by Dan Burcaw on 8/4/22.
//

import AuthenticationServices
import CryptoKit
import NamiApple
import SwiftUI
import UIKit

struct SignInWithApple: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton

    func makeUIView(context _: Context) -> UIViewType {
        return ASAuthorizationAppleIDButton()
    }

    func updateUIView(_: UIViewType, context _: Context) {}
}

class SignInWithAppleDelegates: NSObject {
    private let signInSucceeded: (Bool) -> Void
    private weak var window: UIWindow!

    init(window: UIWindow?, onSignedIn: @escaping (Bool) -> Void) {
        self.window = window
        signInSucceeded = onSignedIn
    }
}

extension SignInWithAppleDelegates: ASAuthorizationControllerDelegate {
    func authorizationController(controller _: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization)
    {
        switch authorization.credential {
        case let appleIdCredential as ASAuthorizationAppleIDCredential:
            if let _ = appleIdCredential.email, let _ = appleIdCredential.fullName {
                // Apple has autherized the use with Apple ID and password
                registerNewAccount(credential: appleIdCredential)
            } else {
                // User has been already exist with Apple Identity Provider
                signInWithExistingAccount(credential: appleIdCredential)
            }

        case let passwordCredential as ASPasswordCredential:
            signInWithUserAndPassword(credential: passwordCredential)

        default:
            break
        }
    }

    func authorizationController(controller _: ASAuthorizationController, didCompleteWithError error: Error) {
        print("\n -- ASAuthorizationControllerDelegate -\(#function) -- \n")
        print(error)
        // Give Call Back to UI
    }

    private func registerNewAccount(credential: ASAuthorizationAppleIDCredential) {
        let userData = UserData(email: credential.email!,
                                name: credential.fullName!,
                                identifier: credential.user)

        print(credential.user) // This is a user identifier

        let keychain = UserDataKeychain()
        do {
            try keychain.store(userData)
        } catch {
            signInSucceeded(false)
        }

        if NamiCustomerManager.isLoggedIn() {
            signInSucceeded(false)
            return
        }

        // need a global register LoginLogout Listener
        //                    namiDataSource.isLoggedIn = true
        NamiCustomerManager.login(withId: credential.user.sha256()) { success, error in
            if success {
                self.signInSucceeded(true)
            } else {
                if let err = error {
                    print("error: \(err)")
                }
            }
        }
    }

    private func signInWithExistingAccount(credential: ASAuthorizationAppleIDCredential) {
        print(credential.user) // This is a user identifier
        print(credential.user.sha256()) // This is a user identifier

        if NamiCustomerManager.isLoggedIn() == false {
            NamiCustomerManager.login(withId: credential.user.sha256()) { success, error in
                if success {
                    print("Login Success")

                    // need a global register LoginLogout Listener
                    //                    namiDataSource.isLoggedIn = true
                    self.signInSucceeded(true)
                    print(NamiCustomerManager.isLoggedIn())
                    print(NamiCustomerManager.loggedInId)

                } else {
                    if let err = error {
                        print("Login error: \(err)")
                    }
                }
            }
        }
    }

    private func signInWithUserAndPassword(credential: ASPasswordCredential) {
        // API Call - Sign in with Username and password
        // Give Call Back to UI

        print("\n ** ASAuthorizationAppleIDCredential - \(#function)** \n")
        print(credential.user) // This is a user identifier
        print(credential.password) // This is a user identifier
    }
}

extension String {
    func sha256() -> String {
        let inputData = Data(utf8)

        let hashed = SHA256.hash(data: inputData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
}
