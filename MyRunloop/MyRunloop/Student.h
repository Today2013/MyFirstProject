//
//  Student.h
//  MyRunloop
//
//  Created by TomatoPeter on 16/7/12.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject<NSCopying>
@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)NSInteger age;
@end
