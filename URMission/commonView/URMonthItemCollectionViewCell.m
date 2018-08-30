//
//  URMonthItemCollectionViewCell.m
//  URMission
//
//  Created by lin weiyan on 2018/8/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMonthItemCollectionViewCell.h"

@interface URMonthItemCollectionViewCell()

@property (nonatomic, strong) UILabel   *dayLabel;

@end

@implementation URMonthItemCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dayLabel = [[UILabel alloc] init];
        self.dayLabel.font = [UIFont systemFontOfSize:15];
        self.dayLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.dayLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.dayLabel.frame = self.bounds;
}

- (void)setDay:(NSString *)day
{
    _day = day;
    if (day.length > 0) {
        self.dayLabel.text = [NSString stringWithFormat:@"%@月", day];
    }
    else {
        self.dayLabel.text = @"";
    }
    
}

@end
