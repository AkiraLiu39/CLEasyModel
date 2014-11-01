//
//  NSObject+CLEasyModel.h
//
//  Created by 刘昶 on 14/10/30.
//  Copyright (c) 2014年 unknown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CLEasyModel)
+(instancetype) instanceWithDict:(NSDictionary *)dict;
-(void) setValuesWithDict:(NSDictionary *)dict;
+(NSArray *) instanceArrayWithArray:(NSArray *)arra;
/**
 *  根据属性名返回自身某个 array 属性内所装的Class 类型,返回 nil 则代表无array里面不需要指定类型,默认返回nil
 *
 *  @param propertyName array属性的属性名
 *
 *  @return array中所装的类的类型
 */
-(Class) classWithArrayProperty:(NSString *)propertyName;
/**
 * 根据属性名返回自身某个 date 属性所需要格式化的模板,返回 nil 则代表不需要格式化,默认返回nil
 *
 *  @param propertyName 属性名
 *
 *  @return 格式化模板 如: yyyy-MM-dd HH:mm:ss
 */
-(NSString *) dateFormatterWithDateProperty:(NSString *)propertyName;
@end
