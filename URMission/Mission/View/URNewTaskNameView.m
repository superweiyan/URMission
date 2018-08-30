//
//  URNewTaskView.m
//  URMission
//
//  Created by lin weiyan on 2018/8/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URNewTaskNameView.h"
#import "Masonry.h"
#import "URCommonMarco.h"
#import "URMissionHeadLineView.h"

typedef void(^tempBlock)(BOOL) ;

@interface URNewTaskNameView()

@property (nonatomic, strong) UITextView     *textView;

//
@property (nonatomic, strong) tempBlock      block;

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
                        
        self.textView = [[UITextView alloc] init];
        [self addSubview:self.textView];
        self.textView.font = [UIFont systemFontOfSize:15];
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self).mas_offset(5);
            make.trailing.mas_equalTo(self).mas_offset(-5);
            make.top.mas_equalTo(self.headLineView.mas_bottom).mas_offset(5);
            make.bottom.mas_equalTo(self).mas_offset(-10);
        }];
    }
    return self;
}

/**
 *  这个地方纯粹只是想试试效果的一个偏门写法，在父类用delegate是更好的选择
 */
- (void)setOptCallback:(TaskOptCallback)optCallback
{
    self.block = optCallback;
    
    WeakSelf()
    void (^v)(BOOL) = ^(BOOL isForward){
        [weakSelf.textView resignFirstResponder];
        if (weakSelf.block) {
            weakSelf.block(isForward);
        }
    };
    [super setOptCallback:v];
}


@end
