//
//  Model.h
//  儿童园地
//
//  Created by Air  wings on 2019/7/30.
//  Copyright © 2019 dlz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSArray * name;
@property(nonatomic,strong)NSArray * content;

+(Model *)modelWithDict:(NSDictionary * )dic;


@end

NS_ASSUME_NONNULL_END
