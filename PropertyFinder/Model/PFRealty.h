//
//  PFRealty.h
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

@import EasyMapping;

@interface PFRealty : EKObjectModel

@property (nonatomic, assign) NSInteger serverID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, assign) NSInteger bedrooms;
@property (nonatomic, assign) NSInteger bathrooms;

+ (EKObjectMapping *)objectMapping;

@end
