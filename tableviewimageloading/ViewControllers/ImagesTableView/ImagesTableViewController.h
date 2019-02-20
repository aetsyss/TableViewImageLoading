//
//  ImagesTableViewController.h
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 18/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagesTableViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImagesTableViewController : UITableViewController

@property (strong, nonatomic) ImagesTableViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
