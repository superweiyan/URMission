//
//  URWeekTitleView.m
//  URMission
//
//  Created by lin weiyan on 2018/8/30.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URWeekTitleView.h"

@interface URWeekTitleView()

@property (nonatomic, strong) NSMutableArray   *titleArray;

@end

@implementation URWeekTitleView

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
        self.titleArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 7; i++) {
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:13];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = [self getTitle:i];
            [self.titleArray addObject:label];
            [self addSubview:label];
        }
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width / 7;
    for (int i = 0; i < self.titleArray.count; i++) {
        UILabel *label = [self.titleArray objectAtIndex:i];
        label.frame = CGRectMake(i*w, 0, w, self.bounds.size.height);
    }
}

- (NSString *)getTitle:(NSUInteger)index
{
    switch (index) {
        case 0:
            return @"日";
            break;
            
        case 1:
            return @"一";
            break;
            
        case 2:
            return @"二";
            break;
            
        case 3:
            return @"三";
            break;
            
        case 4:
            return @"四";
            break;
            
        case 5:
            return @"五";
            break;
            
        case 6:
            return @"六";
            break;
            
        default:
            break;
    }
    return @"";
}

@end
