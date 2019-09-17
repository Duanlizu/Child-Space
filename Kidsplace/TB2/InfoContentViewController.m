//
//  InfoContentViewController.m
//  儿童园地
//
//  Created by Air  wings on 2019/8/5.
//  Copyright © 2019 dlz. All rights reserved.
//
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#import "InfoContentViewController.h"

@interface InfoContentViewController ()

@end

@implementation InfoContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.navigationItem.title = @"资讯";
    [self loadTextView];
}

-(void)loadTextView{
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-65)];
    _textView.text = _infoPage2.content;
    _textView.font = [UIFont fontWithName:@"Arial" size:22];
    _textView.textColor = [UIColor blackColor];
    _textView.backgroundColor = [UIColor whiteColor];
     _textView.editable = NO;
    [self.view addSubview:_textView];
}


@end
