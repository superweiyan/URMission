//
//  UIView+Shadow.h
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Shadow)


/**
 *  UITextView 带滚动条的, 还有 UIView, UIImageView，都不能使用，因为要使用，需要设置clipsToBounds = NO，
 *  这会导致滚动条的contentsize 超过frame，直接显示出来。
 */
- (void)addShadow:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
