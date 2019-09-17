//
//  Second1ViewController.h
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstTableViewCell.h"
#import "Model.h"
#import "Second2ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface Second1ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray * dataArray;

@end

NS_ASSUME_NONNULL_END
