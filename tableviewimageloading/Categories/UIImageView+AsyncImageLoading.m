//
//  UIImageView+AsyncImageLoading.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 19/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "UIImageView+AsyncImageLoading.h"
#import "DataProvider.h"

@implementation UIImageView (AsyncImageLoading)

@dynamic associatedUrl;

- (void)setAssociatedUrl:(NSURL *)url {
    objc_setAssociatedObject(self, @selector(associatedUrl), url, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedUrl {
    return objc_getAssociatedObject(self, @selector(associatedUrl));
}

- (void)loadImageWithURL:(NSURL *)url completion:(void (^)(NSError * _Nullable error))completion {
    [self loadImageWithURL:url dataProvider:[DataProvider shared] completion:completion];
}

- (void)loadImageWithURL:(NSURL *)url dataProvider:(id<DataProviderProtocol>)dataProvider completion:(void (^)(NSError * _Nullable error))completion {

    // handle cases when the UIImageView is being reused
    if (self.associatedUrl && ![self.associatedUrl.absoluteString isEqualToString:url.absoluteString]) {
        if ([dataProvider respondsToSelector:@selector(stopTaskForURL:)]) {
            [dataProvider stopTaskForURL:self.associatedUrl];
        }
    }

    self.associatedUrl = url;
    self.image = nil;

    [dataProvider dataForURL:url completionHandler:^(NSData * _Nullable data, NSError * _Nullable error) {

        dispatch_async(dispatch_get_main_queue(), ^{
            if (data && [self.associatedUrl.absoluteString isEqualToString:url.absoluteString]) {
                [self setImage:[UIImage imageWithData:data]];
            }

            if (completion) {
                completion(error);
            }
        });

    }];

}

@end
