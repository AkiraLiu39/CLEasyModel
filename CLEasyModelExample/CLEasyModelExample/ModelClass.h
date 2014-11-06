//
//  ModelClass.h
//  CLEasyModelExample
//
//  Created by 刘昶 on 14/11/6.
//  Copyright (c) 2014年 unknown. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ModelSubClass;
@interface ModelClass : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSDate *startDate;
@property (nonatomic,strong) ModelSubClass *subClass;
@end
