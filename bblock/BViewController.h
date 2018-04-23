//
//  BViewController.h
//  bblock
//
//  Created by 唐余威 on 2017/6/20.
//  Copyright © 2017年 yyz. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void (^MyBlock)();
@interface BViewController : UIViewController
@property (nonatomic,copy) MyBlock myBlock;
@property (nonatomic,copy) void(^blockName)();

@end
