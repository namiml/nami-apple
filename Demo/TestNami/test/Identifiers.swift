//
//  File.swift
//  Test
//
//  Created by Dan Burcaw on 8/4/22.
//

@Published var trackingStatus = ATTrackingManager.trackingAuthorizationStatus
@Published var currentUUID = ASIdentifierManager.shared().advertisingIdentifier
