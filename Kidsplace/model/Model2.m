//
//  Model2.m
//  儿童园地
//
//  Created by Air  wings on 2019/8/5.
//  Copyright © 2019 dlz. All rights reserved.
//

#import "Model2.h"

@implementation Model2

-(instancetype)initWithDict:(NSDictionary * )dict{
    
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.content = dict[@"content"];
        self.url = dict[@"image"];
    }
    return self;
}

+ (Model2 *)model2WithDict:(NSDictionary *)dic{
    Model2 * dataInfo = [[Model2 alloc]initWithDict:dic];
    return dataInfo;
}


@end
