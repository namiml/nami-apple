//
//  main.m
//  TestObjcApp
//
//  Created by Kendall Gelner on 6/23/19.
//  Copyright © 2019 Nami ML, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <Nami/Nami.h>


int main(int argc, char * argv[]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-result"
    [Nami shared];
#pragma clang diagnostic pop

    @autoreleasepool {
        return UIApplicationMain(argc, argv, NSStringFromClass([NamiApplication class]), NSStringFromClass([AppDelegate class]));
    }
}
