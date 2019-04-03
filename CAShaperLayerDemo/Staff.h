//
//  Staff.h
//  CAShaperLayerDemo
//
//  Created by jiahao on 2019/4/1.
//  Copyright © 2019 SILICN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Staff : NSObject

@property (nonatomic, copy)NSString *name;

@property (nonatomic, copy)NSString *compy;


- (id)initWithName:(NSString *)name compy:(NSString *)compy;


@end

NS_ASSUME_NONNULL_END
