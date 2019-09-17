//
//  RootViewController.m
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//

#import "RootViewController.h"
#import "MainTableViewCell.h"
#import "InfoViewController.h"
#import "MYViewController.h"



#import "First1ViewController.h"
#import "Second1ViewController.h"
#import "Third1ViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MainTableViewCell * VC0 = [[MainTableViewCell alloc]init];
    VC0.view.backgroundColor = [UIColor whiteColor];
    UINavigationController * Nav0 = [[UINavigationController alloc]initWithRootViewController:VC0];
    Nav0.tabBarItem.title = @"首页";
    Nav0.tabBarItem.image = [UIImage imageNamed:@"首页-未点击"];
    Nav0.tabBarItem.selectedImage =[UIImage imageNamed:@"首页 – 点击状态"];
    
    
    
    InfoViewController *VC1 = [[InfoViewController alloc]init];
    VC1.view.backgroundColor = [UIColor whiteColor];
    UINavigationController * Nav1 = [[UINavigationController alloc]initWithRootViewController:VC1];
    Nav1.tabBarItem.title = @"资讯";
    Nav1.tabBarItem.image = [UIImage imageNamed:@"咨询-未点击"];
    Nav1.tabBarItem.selectedImage = [UIImage imageNamed:@"咨询 – 点击状态"];
    
    MYViewController *VC2 = [[MYViewController alloc]init];
    VC2.view.backgroundColor = [UIColor whiteColor];
        UINavigationController * Nav2 = [[UINavigationController alloc]initWithRootViewController:VC2];
    Nav2.tabBarItem.title = @"关于";
    Nav2.tabBarItem.image = [UIImage imageNamed:@"我的-未点击"];
    Nav2.tabBarItem.selectedImage = [UIImage imageNamed:@"我的 –点击状态"];
    
    
    
    self.viewControllers = @[Nav0,Nav1,Nav2];
}


@end
