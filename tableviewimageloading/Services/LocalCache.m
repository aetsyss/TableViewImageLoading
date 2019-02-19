//
//  LocalCache.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 19/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "LocalCache.h"

@interface LocalCache ()
@property (strong, nonatomic) NSMutableDictionary *dict;
@end

@implementation LocalCache

- (instancetype)init {
    if (self = [super init]) {
        _dict = [NSMutableDictionary new];
    }
    return self;
}

- (nullable id)objectForKey:(nonnull id<NSCopying>)key {
    @synchronized (self) {
        return [self.dict objectForKey:key];
    }
}

- (void)setObject:(nullable id)object forKey:(nonnull id<NSCopying>)key {
    @synchronized (self) {
        if (object) {
            [self.dict setObject:object forKey:key];
        } else {
            [self.dict removeObjectForKey:key];
        }
    }
}

@end
