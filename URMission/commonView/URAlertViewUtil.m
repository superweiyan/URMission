//
//  URAlertViewUtil.m
//  URMission
//
//  Created by lin weiyan on 2018/8/12.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URAlertViewUtil.h"

@implementation URAlertViewUtil

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (UIAlertController *)presentAlertView:(NSString *)title msg:(NSString *)msg handler:(void (^)(BOOL))handler
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                         message:msg
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             if (handler) {
                                                                 handler(NO);
                                                             }
                                                         }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         if (handler) {
                                                             handler(YES);
                                                         }
                                                     }];
    
    [controller addAction:okAction];
    [controller addAction:cancelAction];
    
    return controller;
}

@end
