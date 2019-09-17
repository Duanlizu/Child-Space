//
//  InfoTableViewCell.h
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model2.h"


NS_ASSUME_NONNULL_BEGIN

@interface InfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Infolbl;
@property (weak, nonatomic) IBOutlet UIImageView * Picture;

@property(nonatomic,strong)Model2 * data;

@end

NS_ASSUME_NONNULL_END
