//
//  Person+FriendShip.m
//  bblock
//
//  Created by 唐余威 on 2018/3/29.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import "Person+FriendShip.h"
#import <objc/runtime.h>
static NSString *mutableFriendsKey = @"mutableFriendsKey";
@implementation Person (FriendShip)

-(void)setMutableFriends:(NSMutableArray *)mutableFriends {
    objc_setAssociatedObject(self, &mutableFriendsKey, mutableFriends, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray *)mutableFriends {
    return objc_getAssociatedObject(self, &mutableFriendsKey);
}


-(BOOL)isFriendsWith:(Person *)person {
    return YES;
}

-(void)addFriends:(Person *)person {
    [self.mutableFriends addObject:person];
}

-(void)removeFriends:(Person *)person{
    [self.mutableFriends removeObject:person];
}
@end
