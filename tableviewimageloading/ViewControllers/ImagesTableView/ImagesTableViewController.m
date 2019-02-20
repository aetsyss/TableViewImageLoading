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

@implementation ImagesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    if (cell) {
        NSString *imageName = [self.viewModel.images objectAtIndex:indexPath.row];
        ImageTableViewCellViewModel *viewModel = [[ImageTableViewCellViewModel alloc] initWithFileName:imageName index:indexPath.row];
        [cell fillWith:viewModel];
    } else {
        // TODO
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
