//
//  SYCEmployee.m
//  bblock
//
//  Created by 唐余威 on 2018/3/14.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import "SYCEmployee.h"
#import "SYCEmployeeOne.h"
#import "SYCEmployeeTwo.h"
#import "SYCEmployeeThree.h"
@implementation SYCEmployee

+(SYCEmployee *)employeeWithType:(SYCEmployeeType)type {
    switch (type) {
        case SYCEmployeeTypeOne:
            return [SYCEmployeeOne new];
            break;
        case SYCEmployeeTypeTwo:
            return [SYCEmployeeTwo new];
            break;
        case SYCEmployeeTypeThree:
            return [SYCEmployeeThree new];
            break;

    }
}

-(void)doADaysWork {
    //subclass implement this
}

@end
