//
//  URNewTaskSettingView.m
//  URMission
//
//  Created by lin weiyan on 2018/9/1.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URNewTaskSettingView.h"

@interface  URNewTaskSettingView()

@property (nonatomic, strong) UILabel   *priorityLabel;
//@property (nonatomic, strong) 

@end

@implementation URNewTaskSettingView

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
    }
    return self;
}

@end
