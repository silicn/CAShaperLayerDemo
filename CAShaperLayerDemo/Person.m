//
//  Person.m
//  CAShaperLayerDemo
//
//  Created by jiahao on 2019/4/1.
//  Copyright © 2019 SILICN. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"xiaoming";
        self.age = 20;
        
        NSLog(@"%@    %ld",self.name,(long)self.age);
    }
    return self;
}

@end
