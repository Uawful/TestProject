//
//  Person.m
//  bblock
//
//  Created by 唐余威 on 2018/3/29.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import "Person.h"
@interface Person()
@property (nonatomic ,copy ,readwrite)NSString *firstName;
@property (nonatomic ,copy ,readwrite)NSString *secondName;

@end
@implementation Person

-(id)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName {
    if ([super init]) {
        _firstName = firstName;
        _secondName = lastName;
//        _mutableFriends = [NSMutableSet new];
    }
    return self;
}



- (void)doOneDaysWork{
    
}

- (void)doAnotherWork{
    
}

- (void)goToTheCinema;{
    
}

- (void)goToSportsgame{
    
}

@end
