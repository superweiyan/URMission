//
//  NSString+Json.m
//  URMission
//
//  Created by lin weiyan on 2018/9/11.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "NSString+Json.h"

@implementation NSString (Json)

- (id)JSONObject
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if (!data) {
        return nil;
    }
    
    NSError *err = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
    if (err) {
        
    }
    return obj;
}

@end
