//
//  FirstTableViewCell.m
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setFirst1data:(Model *)First1data{
    _titleLbl.text = First1data.title;
}

@end
