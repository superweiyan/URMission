//
//  URMonthInfoCollectionViewCell.m
//  URMission
//
//  Created by lin weiyan on 2018/8/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMonthInfoCollectionViewCell.h"

@interface URMonthInfoCollectionViewCell()

@property (nonatomic, strong) UILabel   *dayLabel;
@property (nonatomic, strong) UILabel   *statusLabel;

@end

@implementation URMonthInfoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dayLabel = [[UILabel alloc] init];
        self.dayLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.dayLabel];
        
        self.statusLabel = [[UILabel alloc] init];
        self.statusLabel.textAlignment = NSTextAlignmentCenter;
        self.statusLabel.text = @"●";
        self.statusLabel.font = [UIFont systemFontOfSize:6];
        [self addSubview:self.statusLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.dayLabel.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 8);
    self.statusLabel.frame = CGRectMake(0, self.bounds.size.height - 8 , self.bounds.size.width, 8);
}

- (void)setDay:(NSString *)day
{
    _day = day;
    self.dayLabel.text = day;
}

@end
