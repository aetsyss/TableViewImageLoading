//
//  LocalCacheTests.m
//  UnitTests
//
//  Created by Alex Tsyss on 03.03.2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LocalCache.h"

@interface LocalCacheTests : XCTestCase
@property (strong, nonatomic) LocalCache *localCache;
@end

@implementation LocalCacheTests

- (void)setUp {
    self.localCache = [[LocalCache alloc] init];
}

- (void)testCacheNonNillObject {
    NSString *a = @"hi";
    [self.localCache setObject:a forKey:@"key"];
    NSString *b = [self.localCache objectForKey:@"key"];
    XCTAssertEqualObjects(a, b);
}

- (void)testCacheNillObject {
    NSString *a = nil;
    [self.localCache setObject:a forKey:@"key"];
    NSString *b = [self.localCache objectForKey:@"key"];
    XCTAssertNil(b);
}

- (void)testCacheObjectWithNillKey {
    NSString *a = @"hi";
    NSString *key = nil;
    [self.localCache setObject:a forKey:key];
    NSString *b = [self.localCache objectForKey:@"key"];
    XCTAssertNil(b);
}

- (void)testCacheTwoObjectsWithDifferentKeys {
    NSString *obj1 = @"obj1";
    NSString *obj2 = @"obj2";
    [self.localCache setObject:obj1 forKey:@"key1"];
    [self.localCache setObject:obj2 forKey:@"key2"];
    NSString *value1 = [self.localCache objectForKey:@"key1"];
    NSString *value2 = [self.localCache objectForKey:@"key2"];
    XCTAssertEqualObjects(obj1, value1);
    XCTAssertEqualObjects(obj2, value2);
}

@end
