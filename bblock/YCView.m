//
//  YCView.m
//  bblock
//
//  Created by 唐余威 on 2017/6/21.
//  Copyright © 2017年 yyz. All rights reserved.
//

#import "YCView.h"

@implementation YCView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.view = [[UILabel alloc]initWithFrame:self.bounds];
        _view.backgroundColor = [UIColor greenColor];
        [self addSubview:_view];
        _view.text = @"XXXXX";
        _view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doMethod)];
        [_view addGestureRecognizer:tap];
    }
    return self;
}

- (void)doMethod {
    if ([_delegate respondsToSelector:@selector(doDelegateMethod:)]) {
        [_delegate doDelegateMethod:_view.text];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
