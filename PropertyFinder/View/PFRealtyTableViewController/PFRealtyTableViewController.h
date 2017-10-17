//
//  PFPropertyTableViewController.h
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFRealtyTableViewModel.h"
@import ReactiveObjC;

@interface PFRealtyTableViewController : UITableViewController

@property (nonatomic, strong) PFRealtyTableViewModel *viewModel;

@end
