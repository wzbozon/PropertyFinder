//
//  PFNetworkService.m
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import "PFNetworkService.h"

@implementation PFNetworkService

+ (NSString *)orderStringFromOrder:(PFOrder)order
{
    NSString *orderString;
    switch (order) {
        case PFOrderPriceAscending:
            orderString = @"pa";
            break;
        case PFOrderPriceDescending:
            orderString = @"pd";
            break;
        case PFOrderBedroomAscending:
            orderString = @"ba";
            break;
        case PFOrderBedroomDescending:
            orderString = @"bd";
            break;
        default:
            break;
    }
    
    return orderString;
}

+ (void)fetchRealtyWithPage:(NSInteger)page
                      order:(PFOrder)order
                 onComplete:(FetchRealtyComplete)completeBlock
                    onError:(FetchRealtyError)errorBlock
{
    NSDictionary *params = @{@"page":@(page),
                             @"order":[PFNetworkService orderStringFromOrder:order]};
    
    [[PFHTTPSessionManager sharedManager] GET:@"mobileapi" parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSDictionary *jsonDic = (NSDictionary *)responseObject;
        NSArray *jsonArray = jsonDic[@"res"];
        NSMutableArray *temp = [NSMutableArray new];
        for (NSDictionary *dic in jsonArray) {
            PFRealty *item = [PFRealty objectWithProperties:dic];
            [temp addObject:item];
        }
        
        completeBlock([NSArray arrayWithArray:temp]);
        
    } failure:^(NSURLSessionTask *task, NSError *error) {
        
        if (errorBlock) errorBlock(error);

    }];
}
                                 
@end
