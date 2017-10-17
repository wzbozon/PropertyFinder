//
//  PFHTTPSessionManager.m
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import "PFHTTPSessionManager.h"

@implementation PFHTTPSessionManager

static PFHTTPSessionManager *_sharedManager = nil;

+ (PFHTTPSessionManager *)sharedManager
{
    if (_sharedManager == nil) {
        NSString *APIDomain = @"https://www.propertyfinder.ae/";
        _sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:APIDomain]];
    }
    
    return _sharedManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        self.responseSerializer.acceptableContentTypes = [self.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    
    return self;
}

@end
