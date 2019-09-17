//
//  InfoTableViewCell.m
//  儿童园地
//
//  Created by Air  wings on 2019/8/2.
//  Copyright © 2019 dlz. All rights reserved.
//

#import "InfoTableViewCell.h"

@implementation InfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)setData:(Model2 *)data{
    _Infolbl.text = data.title;
}

@end
