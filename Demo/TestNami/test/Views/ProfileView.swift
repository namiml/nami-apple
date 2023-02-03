//
//  ProfileView.swift
//  Test Nami
//
//  Copyright © 2022 Nami ML Inc.
//

import SwiftUI
import NamiApple


struct JourneyStateItem: View {
    var label: String
    var state: Bool

    var body: some View {

        HStack {

            if #available(iOS 15.0, *) {
                Circle()
                    .background()
                    .foregroundColor(state == true ? Color("Green") : Color.gray.opacity(0.5))
                    .frame(width: 12, height: 12, alignment: .leading)

            }
            Spacer()

            Text(label)
                .padding(.leading, 10)
                .frame(maxWidth: .infinity, alignment: .leading)

        }

    }
}



struct JourneyState: View {
    var journeyState: CustomerJourneyState

    var body: some View {
        VStack {
            JourneyStateItem(label: "In Trial Period", state: journeyState.inTrialPeriod)
            JourneyStateItem(label: "In Intro Offer Period", state: journeyState.inIntroOfferPeriod)
            JourneyStateItem(label: "Has Cancelled ", state: journeyState.isCancelled)
            JourneyStateItem(label: "Former Subscriber", state: journeyState.formerSubscriber)
            JourneyStateItem(label: "In Grace Period", state: journeyState.inGracePeriod)
            JourneyStateItem(label: "In Account Hold", state: journeyState.inAccountHold)

        }
    }
}

struct IdentifierCell: View {
    var label: String
    var identifier: String

    var body: some View {

        HStack {
            Text(label)
                .fontWeight(.light)
                .font(.system(size: 8))
                .foregroundColor(.gray)
                .frame(width: 45, alignment: .trailing)
            Text(identifier)
                .font(.system(size: 12))
        }
    }

}

struct ProfileView: View {
    @EnvironmentObject var namiDataSource: NamiDataSource
    @State private var copied = false {
        didSet {
            if copied == true {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        copied = false
                    }
                }
            }
        }
    }
    var body: some View {

        Form {

            Section(header: Text(namiDataSource.isLoggedIn == true ? "Registered User" : "Anonymous User")) {

                Button(action: {
                    copy(text: namiDataSource.isLoggedIn == true ? namiDataSource.loggedInId : namiDataSource.deviceId)
                }) {
                    IdentifierCell(label: namiDataSource.isLoggedIn == true ? "External Id" : "Device Id", identifier: namiDataSource.isLoggedIn == true ? namiDataSource.loggedInId! : namiDataSource.deviceId)
                }
            }

            if namiDataSource.journeyState != nil {
                Section(header: Text("Journey State")) {
                    JourneyState(journeyState: namiDataSource.journeyState!)
                }
            }
        }
        .navigationBarTitle("Profile")
        .toolbar {
            Button(namiDataSource.isLoggedIn == true ? "Logout" : "Login") {
                if (namiDataSource.isLoggedIn == true) {
                    NamiCustomerManager.logout()
                } else {
                    NamiCustomerManager.login(withId: UUID().uuidString)
                }
            }
        }
        .onAppear() {
            namiDataSource.updateLoggedInStatus()
        }
    }

    private func copy(text: String?) {
        if let message = text {
            print("Copy to pasteboard \(message))")
            UIPasteboard.general.setValue(message, forPasteboardType: "public.plain-text")
        } else {
            print("Nothing to copy")
        }
    }

    private func showAppleLoginView() {

    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
