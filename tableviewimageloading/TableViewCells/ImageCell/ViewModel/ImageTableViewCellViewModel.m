//
//  ImageTableViewCellViewModel.m
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 18/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import "ImageTableViewCellViewModel.h"

@implementation ImageTableViewCellViewModel

- (instancetype)initWithFileName:(NSString *)fileName index:(NSUInteger)index {
    if (self = [super init]) {
        _fileName = fileName;
        _index = index;
    }

    return self;
}

@end
