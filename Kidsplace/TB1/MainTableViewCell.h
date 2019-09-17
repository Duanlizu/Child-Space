//
//  MainTableViewCell.h
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "First1ViewController.h"
#import "Second1ViewController.h"
#import "Third1ViewController.h"
#import "FirstTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)UITableView * maintableView;

@property(nonatomic,strong)UIScrollView * scroll;
@property(nonatomic,strong)NSArray  * array;
@property(nonatomic,strong)UIPageControl * pageControl;
@property(nonatomic,strong)NSTimer *timer;

@end

NS_ASSUME_NONNULL_END
