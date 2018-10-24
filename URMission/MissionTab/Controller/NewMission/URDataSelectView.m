//
//  URDataSelectView.m
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URDataSelectView.h"
#import "URCommonMarco.h"
#import "Masonry.h"

@interface URDataSelectView()

@property (nonatomic, strong) UILabel       *tipLabel;
@property (nonatomic, strong) UILabel       *tmLabel;
@property (nonatomic, strong) UIButton      *btn;

@end

@implementation URDataSelectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.tipLabel = [[UILabel alloc] init];
        [self addSubview:self.tipLabel];
        [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self).mas_offset(15);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(100, 20));
        }];
        
        self.tmLabel = [[UILabel alloc] init];
        [self addSubview:self.tmLabel];
        self.tmLabel.textAlignment = NSTextAlignmentRight;
        
        [self.tmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.mas_equalTo(self).mas_offset(-15);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(200, 20));
        }];
        
        self.btn = [[UIButton alloc] init];
        [self addSubview:self.btn];
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        Btn_Click(self.btn, @selector(onClicked), UIControlEventTouchUpInside);
    }
    return self;
}

- (void)setTip:(NSString *)tip
{
    _tip = tip;
    self.tipLabel.text = tip;
}

- (void)onClicked
{
    if (self.callback) {
        self.callback();
    }
}

- (void)updateTime:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置时间格式
    formatter.dateFormat = @"yyyy年 MM月 dd日";
    NSString *dateStr = [formatter stringFromDate:date];
    self.tmLabel.text = dateStr;
}

@end
