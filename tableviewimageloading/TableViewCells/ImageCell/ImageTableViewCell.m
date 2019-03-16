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

@implementation ImageTableViewCell

- (void)fillWith:(ImageTableViewCellViewModel *)viewModel {
    self.imageDescriptionLabel.text = viewModel.url.lastPathComponent;
    self.indexLabel.text = @"#";

    [self.image loadImageWithURL:viewModel.url completion:nil];
}

@end
