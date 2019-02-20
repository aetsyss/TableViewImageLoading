//
//  ImagesTableViewController.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 18/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "ImagesTableViewController.h"
#import "ImageTableViewCell.h"
#import "ImageTableViewCellViewModel.h"
#import "ImagesTableDataSource.h"

@interface ImagesTableViewController ()
@property (strong, nonatomic) ImagesTableDataSource *dataSource;
@end

@implementation ImagesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource = [[ImagesTableDataSource alloc] initWithImages:self.viewModel.images];
    self.tableView.dataSource = self.dataSource;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
