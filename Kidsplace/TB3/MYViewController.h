//
//  MYViewController.h
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.


#import <UIKit/UIKit.h>
#import "MYTableViewCell.h"
#import "OursViewController.h"
#import "DelateViewController.h"
#import "MBProgressHUD.h"
#import "LCProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * ThirdtableView;

@end

NS_ASSUME_NONNULL_END
