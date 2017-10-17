//
//  PFRealtyCell.m
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import "PFRealtyCell.h"
#import "UIImageView+WebCache.h"

@implementation PFRealtyCell

- (void)setViewModel:(PFRealtyCellViewModel *)viewModel
{
    _viewModel = viewModel;
    
    [self.thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.thumbnailURLString]];
    self.titleLabel.text = viewModel.titleText;
    self.priceLabel.attributedText = viewModel.priceText;
    self.addressLabel.text = viewModel.addressText;
    self.typeLabel.text = viewModel.typeText;
}

@end
