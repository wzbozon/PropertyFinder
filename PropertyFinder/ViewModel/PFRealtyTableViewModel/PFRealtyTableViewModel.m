//
//  PFRealtyTableViewModel.m
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import "PFRealtyTableViewModel.h"
#import "PFNetworkService.h"
#import "PFRealtyCellViewModel.h"

@implementation PFRealtyTableViewModel

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _order = PFOrderPriceDescending;
        _page = 0;
        _tableData = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (RACSignal *)loadDataSignal
{
    return [[self loadPageSignal] map:^id _Nullable(NSArray*  _Nullable array) {
        NSMutableArray *indexPathArray = [[NSMutableArray alloc] init];
        
        for (PFRealty *realty in array) {
            PFRealtyCellViewModel *cellViewModel = [[PFRealtyCellViewModel alloc] initWithRealty:realty];
            [self.tableData addObject:cellViewModel];
            
            NSInteger row = [self.tableData indexOfObject:cellViewModel];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
            [indexPathArray addObject:indexPath];
        }
        
        self.page ++;
        
        return indexPathArray;
    }];
}

/**
 Loads one page from server
 */
- (RACSignal *)loadPageSignal
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [PFNetworkService
         fetchRealtyWithPage:self.page
         order:self.order
         onComplete:^(NSArray *array) {
             [subscriber sendNext:array];
             [subscriber sendCompleted];
         }
         onError:^(NSError *error) {
             [subscriber sendError:error];
         }];
        
        return nil;
        
    }];
}

@end
