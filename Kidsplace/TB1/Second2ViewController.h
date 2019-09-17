//
//  Second2ViewController.h
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "SecondTableViewCell.h"
#import "Second3ViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface Second2ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)Model * v2data;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * data;
@end

NS_ASSUME_NONNULL_END
