//
//  DataProviderTests.m
//  UnitTests
//
//  Created by Alex Tsyss on 03.03.2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DataProvider.h"
#import "LocalCache.h"

@interface DataProviderTests : XCTestCase
@property (strong, nonatomic) DataProvider *dataProvider;
@property (strong, nonatomic) LocalCache *localCache;
@end

@implementation DataProviderTests

- (void)setUp {
    self.localCache = [[LocalCache alloc] init];
    self.dataProvider = [[DataProvider alloc] initWithCache:self.localCache];
}

- (void)testDataProviderUsesCachedData {
    NSURL *url = [NSURL URLWithString:@"https://www.google.com"];
    NSString *str = @"teststring";
    NSData *testData = [str dataUsingEncoding:NSUTF8StringEncoding];

    [self.localCache setObject:testData forKey:url];

    XCTestExpectation *exp = [self expectationWithDescription:@"data"];

    [self.dataProvider dataForURL:url completionHandler:^(NSData * _Nullable data, NSError * _Nullable error) {
        XCTAssertEqualObjects(testData, data);
        [exp fulfill];
    }];

    [self waitForExpectationsWithTimeout:10 handler:nil];
}

@end
