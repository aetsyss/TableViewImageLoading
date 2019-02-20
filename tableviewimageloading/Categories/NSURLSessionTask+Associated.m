//
//  NSURLSessionTask+Associated.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 19/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "NSURLSessionTask+Associated.h"

@implementation NSURLSessionTask (Associated)

@dynamic associatedCompletionHandlers;

- (void)setAssociatedCompletionHandlers:(NSArray <DownloadTaskCompletion> *)handlers {
    objc_setAssociatedObject(self, @selector(associatedCompletionHandlers), handlers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedCompletionHandlers {
    return objc_getAssociatedObject(self, @selector(associatedCompletionHandlers));
}

- (void)addCompletionHandler:(DownloadTaskCompletion)handler {
    if (!self.associatedCompletionHandlers) {
        self.associatedCompletionHandlers = @[handler];
    } else {
        self.associatedCompletionHandlers = [self.associatedCompletionHandlers arrayByAddingObject:handler];
    }
}

@end
