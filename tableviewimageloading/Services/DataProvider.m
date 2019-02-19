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

    NSData *data = [self.cache objectForKey:url];

    if (data) {
        completionHandler(data, nil);
    } else {
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

            [self.cache setObject:data forKey:url];
            completionHandler(data, error);
        }];

        [task resume];
    }

}

@end
