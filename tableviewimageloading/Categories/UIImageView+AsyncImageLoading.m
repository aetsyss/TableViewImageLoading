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

- (void)loadImageWithURL:(NSURL *)url {
    [self loadImageWithURL:url dataProvider:[DataProvider shared]];
}

- (void)loadImageWithURL:(NSURL *)url dataProvider:(id<DataProviderProtocol>)dataProvider {
    
    if (self.associatedUrl) {
        [dataProvider stopTaskForURL:self.associatedUrl];
    }

    self.associatedUrl = url;
    self.image = nil;

    [dataProvider dataForURL:url completionHandler:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (data && [[self.associatedUrl absoluteString] isEqualToString:[url absoluteString]]) {
            [self performSelectorOnMainThread:@selector(setImage:) withObject:[UIImage imageWithData:data] waitUntilDone:NO];
        }

        if (error) {
            NSLog(@"UIImageView.loadImageWithURL Error: %@", error);
        }
    }];
}

@end
