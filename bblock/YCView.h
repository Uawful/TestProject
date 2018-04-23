//
//  YCView.h
//  bblock
//
//  Created by 唐余威 on 2017/6/21.
//  Copyright © 2017年 yyz. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YCViewDelegate
- (void)doDelegateMethod:(NSString *)value;
@end
@interface YCView : UIView
@property (nonatomic,weak) id delegate;
@property (nonatomic,strong) UILabel *view;
@end
