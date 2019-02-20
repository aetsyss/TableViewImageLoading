//
//  ImagesTableViewModel.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 20/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "ImagesTableViewModel.h"

@implementation ImagesTableViewModel

- (instancetype)initWithImages:(NSArray<NSString *> *)images {
    if (self = [super init]) {
        _images = images;
    }

    return self;
}

@end
