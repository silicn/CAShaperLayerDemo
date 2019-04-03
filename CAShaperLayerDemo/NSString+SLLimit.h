//
//  NSString+SLLimit.h
//  CAShaperLayerDemo
//
//  Created by jiahao on 2019/4/2.
//  Copyright © 2019 SILICN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SLLimit)


/*
  判定string是否只包含汉字，且长度不超过12
  param:  要判定的字符串
*/
- (BOOL)isOnlyContainLimitChinese;


@end

NS_ASSUME_NONNULL_END
