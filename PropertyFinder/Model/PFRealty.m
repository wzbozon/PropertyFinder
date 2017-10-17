//
//  PFRealty.m
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import "PFRealty.h"

@implementation PFRealty

+ (EKObjectMapping *)objectMapping
{
    return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
        
        [mapping mapPropertiesFromDictionary:@{@"id":@"serverID"}];
        [mapping mapPropertiesFromArray:@[@"title",
                                          @"type",
                                          @"thumbnail",
                                          @"price",
                                          @"currency",
                                          @"location",
                                          @"area",
                                          @"bedrooms",
                                          @"bathrooms"]];

    }];
}

@end
