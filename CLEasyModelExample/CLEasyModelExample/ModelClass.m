//
//  ModelClass.m
//  CLEasyModelExample
//
//  Created by 刘昶 on 14/11/6.
//  Copyright (c) 2014年 unknown. All rights reserved.
//

#import "ModelClass.h"

@implementation ModelClass
-(NSString *)description{
    return [NSString stringWithFormat:@"<%@,%p> {name : %@,startDate : %@,subClass : %@",[self class],self,self.name,self.startDate,self.subClass];
}
-(NSString *) dateFormatterWithDateProperty:(NSString *)propertyName{
    return @"yyyy-MM-dd";
}
@end
