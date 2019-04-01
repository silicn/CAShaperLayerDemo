//
//  Staff.m
//  CAShaperLayerDemo
//
//  Created by jiahao on 2019/4/1.
//  Copyright © 2019 SILICN. All rights reserved.
//

#import "Staff.h"

@implementation Staff

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"xiaoming";
        self.compy = @"GuanTong";
        
        NSLog(@"%@    %@",self.name,self.compy);
    }
    return self;
}

@end
