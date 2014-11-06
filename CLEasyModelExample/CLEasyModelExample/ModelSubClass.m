//
//  ModelSubClass.m
//  CLEasyModelExample
//
//  Created by 刘昶 on 14/11/6.
//  Copyright (c) 2014年 unknown. All rights reserved.
//

#import "ModelSubClass.h"

@implementation ModelSubClass
-(NSString *)description{
    return [NSString stringWithFormat:@"<%@,%p> {name : %@,endDate : %@",[self class],self,self.name,self.endDate];
}
-(NSString *) dateFormatterWithDateProperty:(NSString *)propertyName{
    return @"yyyy-MM-dd";
}
@end
