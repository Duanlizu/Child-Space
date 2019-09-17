//
//  Model.m
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//

#import "Model.h"

@implementation Model

-(instancetype)initWithDict:(NSDictionary * )dict{
    
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.name = dict[@"name"];
        self.content = dict[@"content"];
    }
    return self;
}

+ (Model *)modelWithDict:(NSDictionary *)dic{
    Model * dataInfo = [[Model alloc]initWithDict:dic];
    return dataInfo;
}




@end
