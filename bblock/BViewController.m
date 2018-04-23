//
//  BViewController.m
//  bblock
//
//  Created by 唐余威 on 2017/6/20.
//  Copyright © 2017年 yyz. All rights reserved.
//

#import "BViewController.h"
#import <objc/runtime.h>
@interface BViewController ()<UIAlertViewDelegate>

@end

@implementation BViewController
{
    UITextField *textField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"BBB";
    textField = [[UITextField alloc]initWithFrame:CGRectMake(40, 100, 200, 50)];
    textField.layer.borderWidth = 2;
    textField.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self.view addSubview:textField];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(popController)];
    self.navigationItem.leftBarButtonItem = backItem;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(40, 400, 40, 40)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [textField resignFirstResponder];
}
-(void)popController
{
    self.myBlock(textField.text);//触发事件 调用回调函数
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)showAlert {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"title" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"continue", nil];
    void (^block)(NSInteger) = ^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            NSLog(@"cancel");
        }else{
            NSLog(@"continue");
        }
    };
    
    objc_setAssociatedObject(alert, @"keyName", block, OBJC_ASSOCIATION_COPY); //关联属性
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    void(^block)(NSInteger) = objc_getAssociatedObject(alertView, @"keyName");
    block(buttonIndex);
    
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
