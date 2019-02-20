//
//  NSURLSessionTask+Associated.h
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 19/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef void (^DownloadTaskCompletion)(NSData * _Nullable, NSError * _Nullableypes);

NS_ASSUME_NONNULL_BEGIN

@interface NSURLSessionTask (Associated)

@property (nonatomic, strong) NSArray <DownloadTaskCompletion> *associatedCompletionHandlers;

- (void)addCompletionHandler:(DownloadTaskCompletion)handler;

@end

NS_ASSUME_NONNULL_END
