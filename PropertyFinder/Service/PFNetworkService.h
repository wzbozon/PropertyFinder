//
//  PFNetworkService.h
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import "PFHTTPSessionManager.h"
#import "PFRealty.h"
@import ReactiveObjC;

typedef void (^FetchRealtyComplete)(NSArray *);
typedef void (^FetchRealtyError)(NSError *);

typedef NS_ENUM(NSInteger, PFOrder)
{
    PFOrderPriceAscending,
    PFOrderPriceDescending,
    PFOrderBedroomAscending,
    PFOrderBedroomDescending
};

@interface PFNetworkService : NSObject

+ (void)fetchRealtyWithPage:(NSInteger)page
                      order:(PFOrder)order
                 onComplete:(FetchRealtyComplete)completeBlock
                    onError:(FetchRealtyError)errorBlock;

@end
