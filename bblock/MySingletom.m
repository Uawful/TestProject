//
//  MySingletom.m
//  bblock
//
//  Created by 唐余威 on 2018/4/16.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import "MySingletom.h"

@implementation MySingletom
+(MySingletom *)sharedSingletom {
    static MySingletom *singlrtom = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singlrtom = [[self alloc]init];
    });
    return singlrtom;
}

@end
