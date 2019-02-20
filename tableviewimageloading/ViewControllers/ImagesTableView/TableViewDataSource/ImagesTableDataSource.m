//
//  ImagesTableDataSource.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 20/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "ImagesTableDataSource.h"
#import "ImageTableViewCell.h"
#import "ImageTableViewCellViewModel.h"

@interface ImagesTableDataSource ()
@property (strong, nonatomic) NSArray <NSString *> *images;
@end

@implementation ImagesTableDataSource

- (instancetype)initWithImages:(NSArray<NSString *> *)images {
    if (self = [super init]) {
        _images = images;
    }

    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.images.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    NSString *imageName = [self.images objectAtIndex:indexPath.row];
    ImageTableViewCellViewModel *viewModel = [[ImageTableViewCellViewModel alloc] initWithFileName:imageName index:indexPath.row];

    [cell fillWith:viewModel];
    return cell;
}

@end
