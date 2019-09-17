//
//  MYViewController.m
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.
//
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#import "MYViewController.h"

@interface MYViewController ()

@end

@implementation MYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于";
    [self loadTabliview3];
}

-(void)loadTabliview3{
    _ThirdtableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-65)];
    _ThirdtableView.delegate = self;
    _ThirdtableView.dataSource = self;
    [self.view addSubview:_ThirdtableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIImage * img1 = [UIImage imageNamed:@"关于我们"];
    UIImage * img2 = [UIImage imageNamed:@"清除缓存"];
    UIImage * img3 = [UIImage imageNamed:@"意见反馈"];
    NSArray * imgArr = @[img1,img2,img3];
    
    MYTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MYTableViewCell"];
    
    if (cell == nil ) {
        [tableView registerNib:[UINib nibWithNibName:@"MYTableViewCell" bundle:nil] forCellReuseIdentifier:@"MYTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"MYTableViewCell"];
    }
    
    if (indexPath.row == 0) {
        cell.myLBL.text = @"关于我们";
        cell.imgView.image = imgArr[0];
    }else if (indexPath.row == 1){
        cell.myLBL.text =@"清除缓存";
        cell.imgView.image = imgArr[1];
    }else{
        cell.myLBL.text = @"一键反馈";
        cell.imgView.image = imgArr[2];
    }
  
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        OursViewController * page1 = [[OursViewController alloc]init];
        page1.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:page1 animated:YES];
        
    }else if (indexPath.row == 2){
        DelateViewController * page2 = [[DelateViewController alloc]init];
        
        page2.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:page2 animated:YES];
        
    }else{
        [LCProgressHUD showMessage:@"清理成功"];
    }
    
    
    
    
}

@end
