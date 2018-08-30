//
//  URMonthInfoCollectionViewCell.m
//  URMission
//
//  Created by lin weiyan on 2018/8/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMonthInfoCollectionViewCell.h"

@interface URMonthInfoCollectionViewCell()

@property (nonatomic, strong) UIView    *bottomView;
@property (nonatomic, strong) UILabel   *dayLabel;
@property (nonatomic, strong) UILabel   *statusLabel;

@property (nonatomic, strong) NSString *day;
@property (nonatomic, assign) BOOL  selectStatus;
@property (nonatomic, assign) BOOL  hadTaskStatus;


@end

@implementation URMonthInfoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bottomView = [[UIView alloc] init];
        [self addSubview:self.bottomView];
        self.bottomView.backgroundColor = [UIColor redColor];
        self.bottomView.hidden = YES;
        
        self.dayLabel = [[UILabel alloc] init];
        self.dayLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.dayLabel];
        
        self.statusLabel = [[UILabel alloc] init];
        self.statusLabel.textAlignment = NSTextAlignmentCenter;
        self.statusLabel.text = @"●";
        self.statusLabel.hidden = YES;
        self.statusLabel.font = [UIFont systemFontOfSize:6];
        [self addSubview:self.statusLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.dayLabel.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 8);
    CGFloat r = self.dayLabel.bounds.size.width > self.dayLabel.bounds.size.height ? self.dayLabel.bounds.size.height : self.dayLabel.bounds.size.width;
    
    self.bottomView.frame = CGRectMake((self.bounds.size.width - r)/2, 0, r, r);
    self.bottomView.layer.cornerRadius = r/2;
    
    self.statusLabel.frame = CGRectMake(0, self.bounds.size.height - 8 , self.bounds.size.width, 8);
}

//- (void)setDay:(NSString *)day
//{
//    _day = day;
//    self.dayLabel.text = day;
////    self.bottomView.hidden = self.dayLabel.text.length == 0;
////    self.statusLabel.hidden = self.dayLabel.text.length == 0;
//}

- (void)updateStatus:(NSString *)day isSelect:(BOOL)isSelect hasTask:(BOOL)hasTask
{
    _day = day;
    self.dayLabel.text = day;
    self.bottomView.hidden = !isSelect;
    self.statusLabel.hidden = !hasTask;
}

@end
