//
//  URMissionHeadLineView.m
//  URMission
//
//  Created by lin weiyan on 2018/8/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMissionHeadLineView.h"
#import "Masonry.h"

@interface URMissionHeadLineView()

@property (nonatomic, strong) UIButton      *prevBtn;
@property (nonatomic, strong) UILabel       *nameTipLabel;
@property (nonatomic, strong) UIButton      *closeBtn;

@end

@implementation URMissionHeadLineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.prevBtn = [[UIButton alloc] init];
        self.prevBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [self.prevBtn setTitle:@"上一步" forState:UIControlStateNormal];
        [self.prevBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.prevBtn addTarget:self action:@selector(onPrevClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.prevBtn];
        
        [self.prevBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self).mas_offset(5);
            make.top.mas_equalTo(self).mas_offset(3);
            make.size.mas_equalTo(CGSizeMake(50, 30));
        }];
        
        self.closeBtn = [[UIButton alloc] init];
        [self.closeBtn addTarget:self action:@selector(onCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.closeBtn setTitle:@"下一步" forState:UIControlStateNormal];
        self.closeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        
        [self.closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:self.closeBtn];
        
        [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 30));
            make.top.mas_equalTo(self).mas_offset(3);
            make.trailing.mas_equalTo(self).mas_offset(-3);
        }];
        
        self.nameTipLabel = [[UILabel alloc] init];
        [self addSubview:self.nameTipLabel];
//        self.nameTipLabel.text = @"设置习惯名称";
        self.nameTipLabel.font = [UIFont boldSystemFontOfSize:15];
        self.nameTipLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.nameTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.prevBtn.mas_trailing).mas_offset(10);
            make.top.mas_equalTo(self).mas_offset(2);
            make.trailing.mas_equalTo(self.closeBtn.mas_leading).mas_offset(-5);
            make.height.mas_equalTo(30);
        }];
    }
    return self;
}

- (void)onPrevClicked:(id)sender
{
    if (self.cancelCallback) {
        self.cancelCallback();
    }
}

- (void)onCloseBtn:(id)sender
{
    if (self.callback) {
        self.callback();
    }
}

- (void)setHeadline:(NSString *)headline
{
    _headline = headline;
    self.nameTipLabel.text = headline;
}
@end
