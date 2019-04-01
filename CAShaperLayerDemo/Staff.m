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

- (id)initWithName:(NSString *)name compy:(NSString *)compy
{
    self = [super init];
    if (self) {
        self.name = name;
        self.compy = compy;
    }
    return self;
}

@end
