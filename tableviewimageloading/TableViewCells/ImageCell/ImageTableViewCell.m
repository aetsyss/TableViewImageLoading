//
//  ImageTableViewCell.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 18/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "ImageTableViewCell.h"
#import "ImageTableViewCellViewModel.h"
#import "UIImageView+AsyncImageLoading.h"
#import "Constants.h"

@implementation ImageTableViewCell

- (void)fillWith:(ImageTableViewCellViewModel *)viewModel {
    self.imageDescriptionLabel.text = viewModel.fileName;
    self.indexLabel.text = [NSString stringWithFormat:@"%ld", viewModel.index];

    NSString *fullPath = [NSString stringWithFormat:@"%@%@", kImagesBaseUrl, viewModel.fileName];

    NSURL *url = [NSURL URLWithString:fullPath];

    [self.image loadImageWithURL:url];
}

@end
