//
//  DataProvider.h
//  tableviewimageloading
//
//  Created by Aleksei Tsyss on 19/02/2019.
//  Copyright © 2019 Aleksei Tsyss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProviderProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataProvider : NSObject <DataProviderProtocol>

+ (instancetype)shared;

@end

NS_ASSUME_NONNULL_END
