//
//  Person.h
//  bblock
//
//  Created by 唐余威 on 2018/3/29.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic ,copy ,readonly)NSString *firstName;
@property (nonatomic ,copy ,readonly)NSString *secondName;
@property (nonatomic ,strong ,readonly)NSSet *friends;

- (id)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;



- (void)doOneDaysWork;
- (void)doAnotherWork;

- (void)goToTheCinema;
- (void)goToSportsgame;



@end
