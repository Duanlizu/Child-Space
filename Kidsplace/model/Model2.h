//
//  Model2.h
//  儿童园地
//
//  Created by Air  wings on 2019/8/5.
//  Copyright © 2019 dlz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model2 : NSObject
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * content;
@property(nonatomic,strong)NSString * url;

+(Model2 *)model2WithDict:(NSDictionary * )dic;
@end

NS_ASSUME_NONNULL_END
