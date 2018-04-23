//
//  SYCEmployee.h
//  bblock
//
//  Created by 唐余威 on 2018/3/14.
//  Copyright © 2018年 yyz. All rights reserved.
//
//类族

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,SYCEmployeeType){
    SYCEmployeeTypeOne,
    SYCEmployeeTypeTwo,
    SYCEmployeeTypeThree,
};

@interface SYCEmployee : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger salary;

+ (SYCEmployee *)employeeWithType:(SYCEmployeeType)type;
- (void)doADaysWork;

@end
