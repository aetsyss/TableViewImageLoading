//
//  ImageTableViewCellViewModel.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 18/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "ImageTableViewCellViewModel.h"

@implementation ImageTableViewCellViewModel

- (instancetype)initWithImageURL:(NSURL *)url  {
    if (self = [super init]) {
        _url = url;
    }

    return self;
}

@end
