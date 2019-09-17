//
//  InfoViewController.h
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.
//
#import "MBProgressHUD.h"
#import "LCProgressHUD.h"

#import <UIKit/UIKit.h>
#import "InfoTableViewCell.h"
#import "AFHTTPSessionManager.h"
#import "Model2.h"
#import "InfoContentViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * SecondTableView;
@property(nonatomic,strong)NSArray * array;

@end

NS_ASSUME_NONNULL_END
