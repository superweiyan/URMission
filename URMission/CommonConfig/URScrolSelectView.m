//
//  URScrolSelectView.m
//  URMission
//
//  Created by lin weiyan on 2018/9/11.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URScrolSelectView.h"

@interface URScrolSelectView()

@property (nonatomic, strong) UIScrollView  *selectView;

@end

@implementation URScrolSelectView

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
        self.selectView = [[UIScrollView alloc] init];
        self.selectView.backgroundColor = [UIColor blackColor];
        self.selectView.pagingEnabled = YES;
        self.selectView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.selectView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.selectView.frame = self.bounds;
}

- (void)addItems:(NSArray<NSString *> *)itemArray
{
    CGFloat y = 30;
    for (int i = 0; i < itemArray.count; i++) {
        y = i * 30;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, y , self.bounds.size.width, 30)];
        label.text = [itemArray objectAtIndex:i];
        [self.selectView addSubview:label];
    }
    
    self.selectView.contentSize = CGSizeMake(self.bounds.size.width, 30 * itemArray.count);
}

@end
