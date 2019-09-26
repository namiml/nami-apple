//
//  main.swift
//  TestProducts
//
//  Created by Kendall Gelner on 6/28/19.
//  Copyright © 2019 Nami ML, Inc. All rights reserved.
//
import Foundation
import UIKit
import Nami

// This makes sure Nami gets activated as early as possible.
_ = Nami.shared

// Replaces @UIApplictionMain in AppDelegate.swift
_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, NSStringFromClass(NamiApplication.self), NSStringFromClass(AppDelegate.self))
