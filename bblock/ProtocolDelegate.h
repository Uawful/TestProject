//
//  ProtocolDelegate.h
//  bblock
//
//  Created by 唐余威 on 2017/6/21.
//  Copyright © 2017年 yyz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProtocolDelegate <NSObject>
@required
- (void)error;
@optional
- (void)other;
- (void)other2;
- (void)other3;
@end
