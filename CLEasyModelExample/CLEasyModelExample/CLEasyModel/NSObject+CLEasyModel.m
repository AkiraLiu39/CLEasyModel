//
//  NSObject+CLEasyModel.m
//  runTimeDemo
//
//  Created by 刘昶 on 14/10/30.
//  Copyright (c) 2014年 unknown. All rights reserved.
//

#import "NSObject+CLEasyModel.h"
#import <objc/message.h>
@implementation NSObject (CLEasyModel)
+(instancetype) instanceWithDict:(NSDictionary *)dict{
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    id model = [[self alloc]init];
    [model setValuesWithDict:dict];
    return model;
}
+(NSArray *) instanceArrayWithArray:(NSArray *)array{
    NSMutableArray *instances = [NSMutableArray array];
    for(id item in array){
        id instance = [self instanceWithDict:item];
        if (instance) {
            [instances addObject:instance];
        }
    }
    return [instances copy];
}
-(void) setValuesWithDict:(NSDictionary *)dict{
    if (![dict isKindOfClass:[NSDictionary class]]) {
#warning 可做一些处理,列如异常？[NSException raise:@"value <dict> is not a NSDictionary" format:nil];
        return ;
    }
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    for(int i=0;i<propertyCount;i++){
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id propertyValue = dict[propertyName];
        
        if (propertyValue != nil && ![propertyValue isEqual: [NSNull null]]) {
            NSString *propertyAttr = [NSString stringWithUTF8String:property_getAttributes(property)];
            if ([propertyAttr hasPrefix:@"T@"]) {
                // 该属性是一个对象
                NSRange startRange = [propertyAttr rangeOfString:@"\""];
                NSRange endRange = [propertyAttr rangeOfString:@"\"" options:NSBackwardsSearch];
                if (![propertyAttr hasPrefix:@"T@\"NS"] && startRange.location != NSNotFound && startRange.location != endRange.location ) {
                    //该属性为自定义对象
                    NSInteger startIndex = startRange.location + startRange.length;
                    NSInteger endIndex = endRange.location - startIndex;
                    NSString *className = [propertyAttr substringWithRange:NSMakeRange(startIndex, endIndex)];
                    Class propertyClass = NSClassFromString(className);
                    if (propertyClass && [propertyValue isKindOfClass:[NSDictionary class]]) {
                        propertyValue = [propertyClass instanceWithDict:propertyValue];
                    }
                }else if ([propertyAttr hasPrefix:@"T@\"NSArray\""]){
                    //该属性为NSArray对象
                    Class arrayClassType = [self classWithArrayProperty:propertyName];
                    if (arrayClassType && [propertyValue isKindOfClass:[NSArray class]]) {
                        //获取数组内指定的对象类型
                        propertyValue = [arrayClassType instanceArrayWithArray:propertyValue];
                    }
                }else if([propertyAttr hasPrefix:@"T@\"NSDate\""]){
                    //该属性为NSDate对象
                    NSString *dateFormat = [self dateFormatterWithDateProperty:propertyName];
                    if (dateFormat.length) {
                        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                        formatter.dateFormat = dateFormat;
                        propertyValue = [formatter dateFromString:propertyValue];
                    }else{
                        propertyValue = nil;
                    }
                }
            }
            [self setValue:propertyValue forKey:propertyName];
        }
    }
    free(properties);
}

-(Class) classWithArrayProperty:(NSString *)propertyName{
    return nil;
}
-(NSString *) dateFormatterWithDateProperty:(NSString *)propertyName{
    return nil;
}

@end
