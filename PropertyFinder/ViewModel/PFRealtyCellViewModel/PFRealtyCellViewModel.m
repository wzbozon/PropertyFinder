//
//  PFRealtyCellViewModel.m
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import "PFRealtyCellViewModel.h"
#import "PFRealty.h"

@interface PFRealtyCellViewModel()

@property (nonatomic, strong) PFRealty *realty;

@end

@implementation PFRealtyCellViewModel

- (instancetype)initWithRealty:(PFRealty *)realty
{
    self = [super init];
    
    if (self)
    {
        _realty = realty;
        
        _thumbnailURLString = realty.thumbnail;
        _titleText = realty.title;
        _addressText = realty.location;
        
        NSString *priceString = [NSString stringWithFormat:@"%@ %@", realty.price, realty.currency];
        NSRange range = [priceString rangeOfString:realty.price options:NSLiteralSearch];
        NSMutableAttributedString *temp = [[NSMutableAttributedString alloc] initWithString:priceString];
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14]};
        [temp addAttributes:attributes range:range];
        _priceText = temp;

        _typeText = [NSString stringWithFormat:@"%@, %ld bedrooms", realty.type, realty.bedrooms];
    }
    
    return self;
}

@end
