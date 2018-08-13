//
//  URAlertViewUtil.h
//  URMission
//
//  Created by lin weiyan on 2018/8/12.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URAlertViewUtil : UIView

+ (UIAlertController *)presentAlertView:(NSString *)title msg:(NSString *)msg handler:(void (^)(BOOL))handler;

@end
