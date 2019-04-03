//
//  NSString+SLLimit.m
//  CAShaperLayerDemo
//
//  Created by jiahao on 2019/4/2.
//  Copyright © 2019 SILICN. All rights reserved.
//

#import "NSString+SLLimit.h"

@implementation NSString (SLLimit)

- (BOOL)isOnlyContainLimitChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

@end
