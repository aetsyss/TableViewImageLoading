//
//  UIImageView+AsyncImageLoading.h
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 19/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "DataProviderProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (AsyncImageLoading)

@property (nonatomic, strong) NSURL *associatedUrl;

- (void)loadImageWithURL:(NSURL *)url completion:(void (^ _Nullable)(NSError * _Nullable error))completion;
- (void)loadImageWithURL:(NSURL *)url dataProvider:(id<DataProviderProtocol>)dataProvider completion:(void (^ _Nullable)(NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
