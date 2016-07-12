//
//  Student.m
//  MyRunloop
//
//  Created by TomatoPeter on 16/7/12.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

#import "Student.h"

@implementation Student
- (id)copyWithZone:(NSZone *)zone
{
    Student *stu = [Student allocWithZone:zone];
    stu.name = self.name;
    stu.age = self.age;
    return stu;
}
@end
