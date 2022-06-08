//
//  ViewController.m
//  TestObjcApp
//
//  Created by Kendall Gelner on 6/23/19.
//  Copyright © 2019-2021 Nami ML Inc. All rights reserved.
//

#import "ViewController.h"
#import <Nami/Nami-Swift.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [NamiCampaignManager launchWithLabel:nil waitOnData:0.0 launchHandler:^(BOOL success, NSError * _Nullable error) {
        NSLog(@"Could not raise paywall, error was %@.", [error localizedDescription]);
    }];
        
    [NamiMLManager enterCoreContentWithLabel:@"visitingPage"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [NamiMLManager exitCoreContentWithLabel:@"visitingPage"];
}


@end
