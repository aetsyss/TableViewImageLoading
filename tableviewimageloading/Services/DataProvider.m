//
//  DataProvider.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 19/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "DataProvider.h"
#import "CacheProtocol.h"
#import "LocalCache.h"
#import "NSURLSessionTask+Associated.h"

@interface DataProvider ()
@property (strong, nonatomic) id<CacheProtocol> cache;
@end

@implementation DataProvider

+ (instancetype)shared {

    static DataProvider *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataProvider alloc] init];
    });

    return sharedInstance;

}

- (instancetype)init {
    return [self initWithCache:[[LocalCache alloc] init]];
}

- (instancetype)initWithCache:(id<CacheProtocol>)cache {
    if (self = [super init]) {
        _cache = cache;
    }
    return self;
}

- (void)dataForURL:(nonnull NSURL *)url completionHandler:(nonnull void (^)(NSData * _Nullable, NSError * _Nullable))completionHandler {

    // request data from the cache
    NSData *data = [self.cache objectForKey:url];

    // if data from cache is available
    if (data) {
        completionHandler(data, nil);
    } else {

        // get all data tasks
        [[NSURLSession sharedSession] getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {

            // check if a task with the same url is already in progress
            __block NSURLSessionDataTask *originalTask = nil;

            for (NSURLSessionDataTask *task in dataTasks) {
                if ([task.originalRequest.URL.absoluteString isEqualToString:url.absoluteString]) {
                    originalTask = task;
                    break;
                }
            }

            // if there's no such task, create one
            if (!originalTask) {

                originalTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

                    // save data to the cache
                    [self.cache setObject:data forKey:url];

                    // invoke all associated completion handlers
                    for (DownloadTaskCompletion handler in originalTask.associatedCompletionHandlers) {
                        handler(data, error);
                    }

                    [self printTotalTasks];
                    [self runAllSuspendedTasks];
                }];

            }

            // add completion handler to the task's associated array
            [originalTask addCompletionHandler:completionHandler];
            [originalTask resume];

            [self printTotalTasks];
        }];

    }

}

// suspend task for the url
- (void)stopTaskForURL:(nonnull NSURL *)url {
    
    [[NSURLSession sharedSession] getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {

        for (NSURLSessionDataTask *task in dataTasks) {
            if ([task.originalRequest.URL.absoluteString isEqualToString:url.absoluteString]) {
                [task suspend];
                NSLog(@"Task %ld, request: %@ suspended", task.taskIdentifier, task.originalRequest.URL.lastPathComponent);
                break;
            }
        }

    }];
}

// if there's no more running tasks, resume all suspended tasks
- (void)runAllSuspendedTasks {

    [[NSURLSession sharedSession] getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {

        for (NSURLSessionDataTask *task in dataTasks) {
            if (task.state == NSURLSessionTaskStateRunning) {
                return;
            }
        }

        for (NSURLSessionDataTask *task in dataTasks) {
            if (task.state == NSURLSessionTaskStateSuspended) {
                [task resume];
            }
        }

    }];

}

- (void)printTotalTasks {

    [[NSURLSession sharedSession] getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {
        NSLog(@"-----------------------");
        NSLog(@"total tasks: %lu", (unsigned long)[dataTasks count]);

        for (NSURLSessionDataTask *task in dataTasks) {
            NSLog(@"task: %ld, request: %@, state: %ld, completions: %lu", task.taskIdentifier, task.originalRequest.URL.lastPathComponent, (long)task.state, task.associatedCompletionHandlers.count);
        }
    }];

}

@end
