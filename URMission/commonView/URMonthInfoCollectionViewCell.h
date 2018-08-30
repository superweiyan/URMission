//
//  URMonthInfoCollectionViewCell.h
//  URMission
//
//  Created by lin weiyan on 2018/8/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URMonthInfoCollectionViewCell : UICollectionViewCell

- (void)updateStatus:(NSString *)day isSelect:(BOOL)isSelect hasTask:(BOOL)hasTask;

@end
