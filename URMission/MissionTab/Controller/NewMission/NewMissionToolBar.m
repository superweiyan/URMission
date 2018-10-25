//
//  NewMissionToolBar.m
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "NewMissionToolBar.h"
#import "URCommonMarco.h"
#import "Masonry.h"
#import "UIView+Shadow.h"

@interface NewMissionToolBar()

//@property (nonatomic, strong) UIButton  *deadTimeBtn;
//@property (nonatomic, strong) UIButton  *notifiyTimeBtn;
@property (nonatomic, strong) UIButton  *addMissionBtn;

@end

@implementation NewMissionToolBar

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
        [self initViews];
    }
    return self;
}

- (void)initViews
{
//    self.deadTimeBtn = [[UIButton alloc] init];
//    [self addSubview:self.deadTimeBtn];
//    self.deadTimeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [self.deadTimeBtn setTitle:@"开始时间" forState:UIControlStateNormal];
//    [self.deadTimeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    Btn_Click(self.deadTimeBtn, @selector(onDeadTimeClicked:), UIControlEventTouchUpInside);
//    [self.deadTimeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.mas_equalTo(self).mas_offset(15);
//        make.centerY.mas_equalTo(self);
//        make.size.mas_equalTo(CGSizeMake(60, 30));
//    }];
//
//    self.notifiyTimeBtn = [[UIButton alloc] init];
//    [self addSubview:self.notifiyTimeBtn];
//    self.notifiyTimeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [self.notifiyTimeBtn setTitle:@"提醒时间" forState:UIControlStateNormal];
//    [self.notifiyTimeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    Btn_Click(self.notifiyTimeBtn, @selector(onNotifiyTimeClicked:), UIControlEventTouchUpInside);
//    [self.notifiyTimeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.mas_equalTo(self.deadTimeBtn.mas_trailing).mas_offset(15);
//        make.centerY.mas_equalTo(self);
//        make.size.mas_equalTo(CGSizeMake(60, 30));
//    }];
    
    self.addMissionBtn = [[UIButton alloc] init];
    self.addMissionBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.addMissionBtn setTitle:@"保存" forState:UIControlStateNormal];
    self.addMissionBtn.backgroundColor = [UIColor redColor];
    [self addSubview:self.addMissionBtn];
    Btn_Click(self.addMissionBtn, @selector(onEndClicked:), UIControlEventTouchUpInside);
    
    [self.addMissionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.trailing.mas_equalTo(self).mas_offset(-20);
        make.centerY.mas_equalTo(self);
    }];
}

- (void)onEndClicked:(UIButton *)btn
{
    if (self.okBlock) {
        self.okBlock();
    }
}

@end
