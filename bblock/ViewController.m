//
//  ViewController.m
//  bblock
//
//  Created by 唐余威 on 2017/6/20.
//  Copyright © 2017年 yyz. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
#import "YCView.h"
#import "SYCEmployee.h"
#import "Person.h"
#import "Person+FriendShip.h"
#import "UILabel+MyCategory.h"
@interface ViewController ()<CViewControllerDelegate,UIAlertViewDelegate,YCViewDelegate>

@end

@implementation ViewController
{
    UILabel *label;
    YCView *view;
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    Person *person = [person initWithFirstName:@"jack" andLastName:@"Ma"];
    Person *person = [[Person alloc]init];
    person = [person initWithFirstName:@"jack" andLastName:@"Ma"];
    person.mutableFriends = @[@"dd",@"ddd"].mutableCopy;
    
    // Do any additional setup after loading the view, typically from a nib.
    [self classCluster];
    self.title = @"AAA";
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"goNext" forState:UIControlStateNormal];
//    btn.titleLabel.text = @"goNext";
    [btn addTarget:self action:@selector(goNextCol) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    btn2.backgroundColor = [UIColor grayColor];
    [btn2 setTitle:@"goNext" forState:UIControlStateNormal];
    //    btn.titleLabel.text = @"goNext";
    [btn2 addTarget:self action:@selector(goNextCol2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    btn3.backgroundColor = [UIColor grayColor];
    [btn3 setTitle:@"goNext" forState:UIControlStateNormal];
    //    btn.titleLabel.text = @"goNext";
    [btn3 addTarget:self action:@selector(goNextApp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];

    label = [[UILabel alloc]init];
    label.text = @"hehehehehehe";
    label.isCopyable = YES;
    label.frame = CGRectMake(100, 400, 200, 30);
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
    
    view = [[YCView alloc]initWithFrame:CGRectMake(100, 500, 100, 100)];
    view.delegate = self;
    [self.view addSubview:view];
}

- (void)classCluster {
    SYCEmployee *employer = [SYCEmployee employeeWithType:SYCEmployeeTypeOne];
    [employer doADaysWork];
}

- (void)goNextApp {
    NSURL *url = [NSURL URLWithString:@"myAPP://"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:nil completionHandler:nil];
    }
//    [[UIApplication sharedApplication]openURL:[NSUR= URLWithString:@"prefs://root=com.yinjiang.bblock"] options:nil completionHandler:nil];
}

- (void)goNextCol {
    BViewController *col = [[BViewController alloc]init];
    col.myBlock = ^(NSString * text) {
        label.text = text;
    };//登记回调函数，作用就是更新这个页面的信息 一旦触发 响应回调事件
    /**
     * A（登记回调函数）->B(声明回调函数，触发事件后调用回调函数) ->A(响应回调事件)
     A页面埋了个雷，引线在B页面，B页面点着了A页面爆
     */
    
    
    [self.navigationController pushViewController:col animated:NO];
}

- (void)goNextCol2 {
    CViewController *col = [[CViewController alloc]init];
    col.delegate = self;
    [self.navigationController pushViewController:col animated:NO];
}

-(void)sendValue:(NSString *)value {
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:value message:value preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *defult = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    //UIAlertAction *destructive = [UIAlertAction actionWithTitle:@"destructive" style:UIAlertActionStyleDestructive handler:nil];
    [alertView addAction:cancel];
    [alertView addAction:defult];
    [self presentViewController:alertView animated:YES completion:nil];

}

-(void)doDelegateMethod:(NSString *)value {
    label.text = value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
