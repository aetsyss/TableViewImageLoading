//
//  ImageTableViewCell.h
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 18/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageTableViewCellViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface ImageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *imageDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

- (void)fillWith:(ImageTableViewCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
