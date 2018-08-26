//
//  URNewTaskView.m
//  URMission
//
//  Created by lin weiyan on 2018/8/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URNewTaskNameView.h"
#import "Masonry.h"

@interface URNewTaskNameView()

@property (nonatomic, strong) UIButton      *prevBtn;
@property (nonatomic, strong) UILabel       *nameTipLabel;
@property (nonatomic, strong) UIButton      *closeBtn;
@property (nonatomic, strong) UITextView    *textView;

@end

@implementation URNewTaskNameView

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
        self.backgroundColor = [UIColor whiteColor];
        
        self.prevBtn = [[UIButton alloc] init];
        self.prevBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.prevBtn setTitle:@"上一步" forState:UIControlStateNormal];
        [self.prevBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.prevBtn addTarget:self action:@selector(onPrevClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.prevBtn];
        
        [self.prevBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self).mas_offset(5);
            make.top.mas_equalTo(self).mas_offset(3);
            make.size.mas_equalTo(CGSizeMake(40, 30));
        }];
        
        self.closeBtn = [[UIButton alloc] init];
        [self.closeBtn addTarget:self action:@selector(onCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.closeBtn setTitle:@"下一步" forState:UIControlStateNormal];
        self.closeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:self.closeBtn];
        
        [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(40, 30));
            make.top.mas_equalTo(self).mas_offset(3);
            make.trailing.mas_equalTo(self).mas_offset(-3);
        }];
        
        self.nameTipLabel = [[UILabel alloc] init];
        [self addSubview:self.nameTipLabel];
        self.nameTipLabel.text = @"设置习惯名称";
        self.nameTipLabel.textAlignment = NSTextAlignmentCenter;
        self.nameTipLabel.font = [UIFont systemFontOfSize:13];
        
        [self.nameTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.prevBtn.mas_trailing).mas_offset(10);
            make.top.mas_equalTo(self).mas_offset(2);
            make.trailing.mas_equalTo(self.closeBtn.mas_leading).mas_offset(-5);
            make.height.mas_equalTo(30);
        }];
        
        UIView *spiteLine = [[UIView alloc] init];
        spiteLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:spiteLine];
        
        [spiteLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self);
            make.trailing.mas_equalTo(self);
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(self.nameTipLabel.mas_bottom).mas_offset(3);
        }];
        
        self.textView = [[UITextView alloc] init];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)onPrevClicked:(id)sender
{
    
}

- (void)onCloseBtn:(id)sender
{
    if (self.callback) {
        self.callback();
    }
}

@end
