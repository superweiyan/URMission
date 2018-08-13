//
//  NSString+Utils.m
//  URMission
//
//  Created by lin weiyan on 2018/8/12.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (NSString *)filterSpace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
