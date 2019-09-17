//
//  FirstTableViewCell.h
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"


NS_ASSUME_NONNULL_BEGIN

@interface FirstTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property(nonatomic,strong)Model * First1data;

@end

NS_ASSUME_NONNULL_END
