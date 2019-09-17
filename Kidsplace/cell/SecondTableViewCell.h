//
//  SecondTableViewCell.h
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
NS_ASSUME_NONNULL_BEGIN

@interface SecondTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLBL;
@property(nonatomic,strong)Model * seconddata;

@end

NS_ASSUME_NONNULL_END
