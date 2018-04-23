//
//  NSTimer+MyBlockSupport.h
//  bblock
//
//  Created by 唐余威 on 2018/4/17.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (MyBlockSupport)
+(NSTimer *)syc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)())block
                                       repeats:(BOOL)repeats;
@end
