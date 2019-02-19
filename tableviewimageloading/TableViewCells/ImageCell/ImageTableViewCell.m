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

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFromNib, imageView: %p", self.image);
}

- (void)prepareForReuse {
    [super prepareForReuse];
    NSLog(@"prepareForReuse: %p", self.image);
    // TODO cancel / pause downloading task for the imageView
}

- (void)fillWith:(ImageTableViewCellViewModel *)viewModel {
    self.imageDescriptionLabel.text = viewModel.fileName;
    self.indexLabel.text = [NSString stringWithFormat:@"%ld", viewModel.index];

    NSString *fullPath = [NSString stringWithFormat:@"https://crdms.images.consumerreports.org/w_444/prod/products/cr/models/%@", viewModel.fileName];
    NSURL *url = [NSURL URLWithString:fullPath];
    [self.image loadImageWithURL:url];
}

@end
