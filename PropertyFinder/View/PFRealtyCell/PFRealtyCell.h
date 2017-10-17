//
//  PFRealtyCell.h
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFRealtyCellViewModel.h"

@interface PFRealtyCell : UITableViewCell

@property (nonatomic, strong) PFRealtyCellViewModel *viewModel;

@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *typeLabel;

@end
