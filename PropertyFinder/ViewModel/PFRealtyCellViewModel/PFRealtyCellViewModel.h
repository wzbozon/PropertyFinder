//
//  PFRealtyCellViewModel.h
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFRealty;

@interface PFRealtyCellViewModel : NSObject

@property (nonatomic, strong) NSString *thumbnailURLString;
@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *addressText;
@property (nonatomic, strong) NSAttributedString *priceText;
@property (nonatomic, strong) NSString *typeText;

- (instancetype)initWithRealty:(PFRealty *)realty;

@end
