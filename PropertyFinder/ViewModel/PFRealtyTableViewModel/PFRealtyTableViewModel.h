//
//  PFRealtyTableViewModel.h
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import "PFNetworkService.h"

@interface PFRealtyTableViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *tableData;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) PFOrder order;

/**
 Loads next page and adds an array of new objects to the tableData
 */
- (RACSignal *)loadDataSignal;

@end
