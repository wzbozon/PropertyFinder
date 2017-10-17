//
//  PFPropertyTableViewController.m
//  PropertyFinder
//
//  Created by Dennis Kutlubaev on 16.10.17.
//  Copyright © 2017 Alwawee. All rights reserved.
//

#import "PFRealtyTableViewController.h"
#import "PFRealtyCell.h"
#import "PFLoadingFooterView.h"

@interface PFRealtyTableViewController ()

@end

@implementation PFRealtyTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setting up UIRefreshControl
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self
                            action:@selector(reloadTableView)
                  forControlEvents:UIControlEventValueChanged];
    
    // Setting up ViewModel (could be injected if we wouldn't use Storyboard)
    self.viewModel = [[PFRealtyTableViewModel alloc] init];
    
    // Setting up order change trigger
    @weakify(self);
    [RACObserve(self.viewModel, order) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self reloadTableView];
    }];
    
    // Setting up table footer view
    PFLoadingFooterView *loadingFooterView = [[[NSBundle mainBundle] loadNibNamed:@"PFLoadingFooterView" owner:self options:nil] firstObject];
    [loadingFooterView setFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 100)];
    self.tableView.tableFooterView = loadingFooterView;
    
    // Setting up actions button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionClicked:)];
}

- (void)reloadTableView
{
    self.viewModel.page = 0;
    [self.viewModel.tableData removeAllObjects];
    [self.tableView reloadData];
    
    [[self.viewModel loadDataSignal] subscribeNext:^(id  _Nullable x) {
        [self.tableView reloadData];
        [self.tableView.refreshControl endRefreshing];
    }];
}

- (void)actionClicked:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorting"
                                                                             message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Price ascending"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                          self.viewModel.order = PFOrderPriceAscending;
                                                          
                                                      }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Price descending"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                          self.viewModel.order = PFOrderPriceDescending;
                                                          
                                                      }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Bedroom ascending"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                          self.viewModel.order = PFOrderBedroomAscending;
                                                          
                                                      }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Bedroom descending"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                          self.viewModel.order = PFOrderBedroomDescending;
                                                          
                                                      }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If there is no data in tableData for this indexPath, we load next page
    if (indexPath.row == [self.viewModel.tableData count] - 1)
    {
        [[self.viewModel loadDataSignal] subscribeNext:^(NSArray*  _Nullable indexPathArray)
        {
            [self.tableView beginUpdates];
            [self.tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView endUpdates];
        }];
    }
    
    // If there is data for this indexPath, we create a cell
    if ( indexPath.row < self.viewModel.tableData.count && self.viewModel.tableData.count > 0)
    {
        PFRealtyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PFRealtyCellIdentifier" forIndexPath:indexPath];
        cell.viewModel = self.viewModel.tableData[indexPath.row];
        return cell;
    }

    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

@end
