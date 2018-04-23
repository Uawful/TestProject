//
//  NSTimer+MyBlockSupport.m
//  bblock
//
//  Created by 唐余威 on 2018/4/17.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import "NSTimer+MyBlockSupport.h"

@implementation NSTimer (MyBlockSupport)
+(NSTimer *)syc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void (^)())block
                                       repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(syc_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+(void)syc_blockInvoke:(NSTimer *)timer {
    void(^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

@end
