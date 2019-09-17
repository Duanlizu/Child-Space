//
//  MYTableViewCell.h
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *myLBL;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIView *Backview;


@end

NS_ASSUME_NONNULL_END
