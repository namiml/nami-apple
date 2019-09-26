//
//  ViewController.m
//  TestObjcApp
//
//  Created by Kendall Gelner on 6/23/19.
//  Copyright © 2019 Nami ML, Inc. All rights reserved.
//

#import "ViewController.h"
#import <Nami/Nami.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NamiPaywallManager shared] presentLivePaywallFromVC:nil];
}


@end
