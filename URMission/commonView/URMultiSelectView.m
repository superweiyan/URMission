//
//  URMultiSelectView.m
//  URMission
//
//  Created by lin weiyan on 2018/9/3.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMultiSelectView.h"

@interface URMultiSelectView()

@property (nonatomic, strong) NSMutableArray        *BtnArray;

@end

@implementation URMultiSelectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithTitleArray:(NSArray *)titleArray
{
    self = [super init];
    if (self) {
        self.BtnArray = [[NSMutableArray alloc] init];
        [self initTitleArray:titleArray];
    }
    return self;
}

- (void)initTitleArray:(NSArray *)titleArray
{
    for (int i = 0; i < titleArray.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(onBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.BtnArray addObject:btn];
        [self addSubview:btn];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width / self.BtnArray.count;
    
    for (int i = 0; i < self.BtnArray.count; i++) {
        UIButton *btn = [self.BtnArray objectAtIndex:i];
        btn.frame = CGRectMake(i * w, 0, w, self.frame.size.height);
    }
}

- (void)onBtnClicked:(UIButton *)sender
{
    NSInteger index = sender.tag;
    for (int i = 0; i < self.BtnArray.count; i++) {
        UIButton *btn = [self.BtnArray objectAtIndex:i];
        if (i == index) {
            btn.backgroundColor = [UIColor redColor];
        }
        else {
            btn.backgroundColor = [UIColor whiteColor];
        }
    }
    
    if (self.selectBlock) {
        self.selectBlock(index);
    }
}

@end
