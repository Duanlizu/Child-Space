//
//  InfoContentViewController.h
//  儿童园地
//
//  Created by Air  wings on 2019/8/5.
//  Copyright © 2019 dlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model2.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfoContentViewController : UIViewController

@property(nonatomic,strong)Model2 * infoPage2;
@property(nonatomic,strong)UITextView * textView;
@property(nonatomic,strong)NSString * text;

@end

NS_ASSUME_NONNULL_END
