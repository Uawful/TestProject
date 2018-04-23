//
//  CViewController.m
//  bblock
//
//  Created by 唐余威 on 2017/6/21.
//  Copyright © 2017年 yyz. All rights reserved.
//

#import "CViewController.h"
#import "ProtocolDelegate.h"
@interface CViewController ()<ProtocolDelegate>

@end

@implementation CViewController
{
    UITextField *textField;
}

- (void)error {
    
}

- (void)popController {
    [self.navigationController popViewControllerAnimated:YES];
    if ([_delegate respondsToSelector:@selector(sendValue:)]) { // 如果协议响应了sendValue:方法
        [_delegate sendValue:textField.text]; // 通知执行协议方法
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    textField = [[UITextField alloc]initWithFrame:CGRectMake(40, 100, 200, 50)];
    textField.layer.borderWidth = 2;
    textField.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self.view addSubview:textField];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(popController)];
    self.navigationItem.leftBarButtonItem = backItem;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
