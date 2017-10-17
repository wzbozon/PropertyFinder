//
//  AppDelegate.m
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import "AppDelegate.h"
@import AFNetworking;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkActivityIndicatorManager sharedManager] setActivationDelay:0];
    
    return YES;
}

@end
