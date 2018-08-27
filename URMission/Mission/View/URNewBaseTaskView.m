//
//  URNewBaseTaskView.m
//  URMission
//
//  Created by lin weiyan on 2018/8/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URNewBaseTaskView.h"
#import "URMissionHeadLineView.h"
#import "Masonry.h"
#import "URCommonMarco.h"

@interface URNewBaseTaskView()

@end

@implementation URNewBaseTaskView

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
        self.headLineView = [[URMissionHeadLineView alloc] init];
        [self addSubview:self.headLineView];
        [self.headLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self);
            make.trailing.mas_equalTo(self);
            make.top.mas_equalTo(self);
            make.height.mas_equalTo(40);
        }];
        
        WeakSelf()
        self.headLineView.callback = ^{
            if(weakSelf.optCallback) {
                weakSelf.optCallback(YES);
            }
        };
        
        self.headLineView.cancelCallback = ^{
            if (weakSelf.optCallback) {
                weakSelf.optCallback(NO);
            }
        };
        
        UIView *spiteLine = [[UIView alloc] init];
        spiteLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:spiteLine];
        
        [spiteLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self);
            make.trailing.mas_equalTo(self);
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(self.headLineView.mas_bottom).mas_offset(3);
        }];

    }
    return self;
}

- (void)updateHeadline:(NSString *)headLine
{
    self.headLineView.headline = headLine;
}

@end
