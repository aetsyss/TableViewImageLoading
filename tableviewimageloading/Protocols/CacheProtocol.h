//
//  CacheProtocol.h
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 19/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CacheProtocol <NSObject>
- (nullable id)objectForKey:(id<NSCopying>)key;
- (void)setObject:(nullable id)object forKey:(id<NSCopying>)key;
@end

NS_ASSUME_NONNULL_END
