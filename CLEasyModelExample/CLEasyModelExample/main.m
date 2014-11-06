//
//  main.m
//  CLEasyModelExample
//
//  Created by 刘昶 on 14/11/2.
//  Copyright (c) 2014年 unknown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLEasyModel/NSObject+CLEasyModel.h"
#import "ModelClass.h"
#import "ModelSubClass.h"

void testDate();
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        testDate();
    }
    return 0;
}

void testDate(){
    NSDictionary *subModelClassDict = @{
                                        @"name":@"name in subModelClass",
                                        @"endDate":@"2014-02-11"
                                        };
    NSDictionary *modelClassDict = @{
                           @"name":@"name in modelClass",
                           @"startDate":@"2014-01-10",
                           @"subClass":subModelClassDict};
    ModelClass *model = [ModelClass instanceWithDict:modelClassDict];
    NSLog(@" result : %@",model);
    
}

