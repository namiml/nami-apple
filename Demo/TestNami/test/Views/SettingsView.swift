//
//  SettingsView.swift
//  Test Nami
//
//  Copyright © 2022 Nami ML Inc.
//

import AuthenticationServices
import NamiApple
import SwiftUI
import UIKit

struct SettingsView: View {
    @EnvironmentObject var namiDataSource: NamiDataSource

    @State var appleSignInDelegates: SignInWithAppleDelegates! = nil
    private weak var window: UIWindow!

    var body: some View {
        ZStack {
            if namiDataSource.isLoggedIn != true {
                SignInWithApple()
                    .onTapGesture(perform: showAppleLogin)
                    .frame(width: 280, height: 60, alignment: .center)
            }
        }

        .navigationTitle("Settings")
    }

    private func showAppleLogin() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        performSignIn(using: [request])
    }

    private func performSignIn(using requests: [ASAuthorizationRequest]) {
        appleSignInDelegates = SignInWithAppleDelegates(window: window) { success in
            if success {
                // update UI
                namiDataSource.updateLoggedInStatus()
            } else {
                // show the user an error
            }
        }

        let controller = ASAuthorizationController(authorizationRequests: requests)
        controller.delegate = appleSignInDelegates

        controller.performRequests()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
