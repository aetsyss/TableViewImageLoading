//
//  AsyncImageLoading.m
//  UnitTests
//
//  Created by Aleksei Tsyss on 16/03/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DataProvider.h"
#import "LocalCache.h"
#import "UIImageView+AsyncImageLoading.h"

@interface AsyncImageLoading : XCTestCase
@property (strong, nonatomic) DataProvider *dataProvider;
@property (strong, nonatomic) LocalCache *localCache;
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation AsyncImageLoading

- (void)setUp {
    self.localCache = [[LocalCache alloc] init];
    self.dataProvider = [[DataProvider alloc] initWithCache:self.localCache];
    self.imageView = [[UIImageView alloc] init];
}

- (void)testAsyncImageLoadingFromCache {
    NSURL *url = [NSURL URLWithString:@"https://www.google.com"];

    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"test" ofType:@"png"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *testImage = [UIImage imageWithData:data];

    [self.localCache setObject:data forKey:url];

    XCTestExpectation *exp = [self expectationWithDescription:@"loadImage"];

    [self.imageView loadImageWithURL:url dataProvider:self.dataProvider completion:^(NSError * _Nullable error) {

        NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
        NSData *testData = UIImagePNGRepresentation(testImage);

        XCTAssertEqualObjects(testData, imageData);

        [exp fulfill];
    }];

    [self waitForExpectationsWithTimeout:10 handler:nil];
}


@end
