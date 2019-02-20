//
//  ImagesTableViewModel.h
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 20/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImagesTableViewModel : NSObject

@property (strong, nonatomic) NSArray <NSString *> *images;

- (instancetype)initWithImages:(NSArray <NSString *> *)images;

@end

NS_ASSUME_NONNULL_END
