//
//  CViewController.h
//  bblock
//
//  Created by 唐余威 on 2017/6/21.
//  Copyright © 2017年 yyz. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CViewControllerDelegate
- (void)sendValue:(NSString *)value;
@end

@interface CViewController : UIViewController
@property (nonatomic,weak) id delegate;
@end
