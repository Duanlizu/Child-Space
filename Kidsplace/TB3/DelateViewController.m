//
//  DelateViewController.m
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.
//
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#import "DelateViewController.h"

@interface DelateViewController ()
@property(nonatomic,strong)UITextView * textView;
@end

@implementation DelateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"一键反馈";
    [self setrightButton];
    

    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.backgroundColor = [UIColor whiteColor];
    

    _textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH-20, 150)];
    _textView.layer.borderColor = [[UIColor blackColor]CGColor];
    _textView.layer.borderWidth = 1.0;
    _textView.layer.cornerRadius = 5.0;
    _textView.keyboardType = UIKeyboardTypeDefault;

    [view addSubview:_textView];
    [self.view addSubview:view];
}
-(void)setrightButton{

    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancleButton setTitle:@"提交" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [cancleButton addTarget:self action:@selector(cancleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:cancleButton];
    rightItem.imageInsets = UIEdgeInsetsMake(0, -15,0, 0);//设置向左偏移
    self.navigationItem.rightBarButtonItem = rightItem;
    
}


-(void)cancleButtonClicked{
    if ([_textView.text isEqualToString:@""]) {
        [LCProgressHUD showMessage:@"内容不能为空"];
    }else{
        [self loadimg];
        [self delayMothod];
    }
}

-(void)loadimg{
    _HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES] ;
    _HUD.delegate = self;
    _HUD.color = [UIColor grayColor];
    _HUD.dimBackground = NO;
    [_HUD hide:YES afterDelay:1.5];
}

-(void)delayMothod{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(delay) userInfo:nil repeats:NO];
}
-(void)delay{
    [LCProgressHUD showMessage:@"提交成功"];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}
@end
