//
//  PFHTTPSessionManager.h
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

@import AFNetworking;

@interface PFHTTPSessionManager : AFHTTPSessionManager

+ (PFHTTPSessionManager *)sharedManager;

- (instancetype)initWithBaseURL:(NSURL *)url;

@end
