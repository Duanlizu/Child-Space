//
//  SecondTableViewCell.m
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)setSeconddata:(Model *)seconddata{
    
    _nameLBL.text = seconddata.name;
}


@end
