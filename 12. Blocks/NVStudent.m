//
//  NVStudent.m
//  12. Blocks
//
//  Created by Admin on 21.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NVStudent.h"

@implementation NVStudent
-(NSString*) description {
    NSString* string=[NSString stringWithFormat:@"%@ %@",self.lastname, self.firstname];
    return string;
}
@end
