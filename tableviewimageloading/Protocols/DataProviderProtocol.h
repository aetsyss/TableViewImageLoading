//
//  DataProviderProtocol.h
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 19/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DataProviderProtocol <NSObject>

- (void)dataForURL:(NSURL *)url completionHandler:(void (^)(NSData * _Nullable data, NSError * _Nullable error))completionHandler;

@optional
- (void)stopTaskForURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
