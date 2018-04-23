//
//  Person+FriendShip.h
//  bblock
//
//  Created by 唐余威 on 2018/3/29.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import "Person.h"

@interface Person (FriendShip)
@property (nonatomic,strong)NSMutableArray *mutableFriends;
- (void)addFriends:(Person *)person;
- (void)removeFriends:(Person *)person;
- (BOOL)isFriendsWith:(Person *)person;
@end
