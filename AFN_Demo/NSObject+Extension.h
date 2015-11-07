//
//  NSObject+Extension.h
//  新闻
//
//  Created by apple on 15/6/21.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

/**
 *  字典转模型
 */
+ (instancetype)objectWithDict:(NSDictionary *)dict;
/**
 *  加载类的属性数组
 */
+ (NSArray *)loadProperties;

@end
