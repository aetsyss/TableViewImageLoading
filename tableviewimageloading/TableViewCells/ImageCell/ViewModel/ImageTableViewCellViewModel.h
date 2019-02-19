//
//  ImageTableViewCellViewModel.h
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 18/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageTableViewCellViewModel : NSObject

@property (copy, nonatomic) NSString *fileName;
@property (nonatomic) NSUInteger index;

- (instancetype)initWithFileName:(NSString *)fileName index:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
