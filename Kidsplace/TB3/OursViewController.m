//
//  OursViewController.m
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.
//
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#import "OursViewController.h"

@interface OursViewController ()

@end

@implementation OursViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"关于我们";
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.backgroundColor = [UIColor whiteColor];
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-70)/2, (SCREEN_HEIGHT-70)/2-200, 70, 70)];
    UIImage * img = [UIImage imageNamed:@"启动图标-1"];
    imgView.image = img;
    [view addSubview:imgView];
    
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-150)/2, (SCREEN_HEIGHT-70)/2-120, 150, 20)];
    lbl.text = @"儿童园地 For iPhone V1.0";
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.font = [UIFont systemFontOfSize:12];
    lbl.textColor = [UIColor lightGrayColor];

    UILabel * lblend = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-250)/2, SCREEN_HEIGHT-35, 250, 25)];
    
    lblend.text = @"Copy right©2019-2028 儿童园地版权所有";
    lblend.textAlignment = NSTextAlignmentCenter;
    lblend.font = [UIFont systemFontOfSize:12];
    lblend.textColor = [UIColor lightGrayColor];
    
    
    [view addSubview:imgView];
    [view addSubview:lbl];
    [view addSubview:lblend];
    
    [self.view addSubview:view];
}


@end
