//
//  URNewTaskSettingView.m
//  URMission
//
//  Created by lin weiyan on 2018/9/1.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URNewTaskSettingView.h"
#import "Masonry.h"
#import "URMissionHeadLineView.h"
#import "URMultiSelectView.h"
#import "URCommonMarco.h"
#import "AppDelegate.h"
#import "URMissionModule.h"
#import "URMissionSelectTagView.h"
#import "URTaskTagView.h"

@interface  URNewTaskSettingView()

@property (nonatomic, strong) UILabel            *priorityLabel;
@property (nonatomic, strong) URMultiSelectView  *mulitSelectView;

@property (nonatomic, strong) UILabel           *tagTipLabel;
@property (nonatomic, strong) UIButton          *tagBtn;

@property (nonatomic, strong) NSArray           *tagArray;

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
        [self initData];
        [self initViews];
    }
    return self;
}

- (void)initData
{
    self.tagArray = [[URMissionModule sharedObject] getTagArray];
    
}

- (void)initViews
{
    self.priorityLabel = [[UILabel alloc] init];
    self.priorityLabel.text = @"优先级";
    [self addSubview:self.priorityLabel];
    
    [self.priorityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).mas_offset(40);
        make.top.mas_equalTo(self.headLineView.mas_bottom).mas_offset(100);
        make.size.mas_equalTo(CGSizeMake(100, 25));
    }];
    
    self.mulitSelectView = [[URMultiSelectView alloc] initWithTitleArray:@[@"低", @"中", @"高"]];
    [self addSubview:self.mulitSelectView];
    WeakSelf()
    self.mulitSelectView.selectBlock = ^(NSUInteger level) {
        [weakSelf handlePrioritySelect:level];
    };
    
    [self.mulitSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.priorityLabel.mas_trailing).mas_offset(20);
        make.top.mas_equalTo(self.headLineView.mas_bottom).mas_offset(100);
        make.size.mas_equalTo(CGSizeMake(90, 25));
    }];
    
    self.tagTipLabel = [[UILabel alloc] init];
    self.tagTipLabel.text = @"标签";
    [self addSubview:self.tagTipLabel];
    
    [self.tagTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.priorityLabel.mas_bottom).mas_offset(20);
        make.leading.mas_equalTo(self).mas_offset(40);
        make.size.mas_equalTo(CGSizeMake(100, 25));
    }];
    
    self.tagBtn = [[UIButton alloc] init];
    self.tagBtn.backgroundColor = [UIColor blueColor];
    [self.tagBtn setTitle:@"标签" forState:UIControlStateNormal];
    [self.tagBtn addTarget:self action:@selector(onTagClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.tagBtn];
    [self.tagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.priorityLabel.mas_bottom).mas_offset(20);
        make.leading.mas_equalTo(self.priorityLabel.mas_trailing).mas_offset(20);
        make.size.mas_equalTo(CGSizeMake(60, 25));
    }];
    
    UIButton *newTag = [[UIButton alloc] init];
    newTag.titleLabel.font = [UIFont systemFontOfSize:13];
    [newTag setTitle:@"添加" forState:UIControlStateNormal];
    newTag.backgroundColor = [UIColor blueColor];
    [newTag addTarget:self action:@selector(onNewTagClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:newTag];
    
    [newTag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.tagBtn.mas_trailing).mas_offset(15);
        make.top.mas_equalTo(self.priorityLabel.mas_bottom).mas_offset(20);
        make.size.mas_equalTo(CGSizeMake(50, 25));
    }];
}

- (void)handlePrioritySelect:(NSUInteger)priorityLevel
{
    
}

- (void)onTagClicked:(UIButton *)sender
{
//    CGRect rect = sender.frame;
//    URScrolSelectView *s = [[URScrolSelectView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, 40, 90)];
//    [s addItems:self.tagArray];
//    [self addSubview:s];
    
    URTaskTagView *taskTagView = [[URTaskTagView alloc] initWithFrame:CGRectMake(0,
                                                                                 [UIScreen mainScreen].bounds.size.height,
                                                                                 [UIScreen mainScreen].bounds.size.width,
                                                                                 200)];
    
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UINavigationController *navVC = (UINavigationController *)appDelegate.window.rootViewController;
    UIViewController *vc = navVC.visibleViewController;

    taskTagView.tagsArray = self.tagArray;
    
    [vc.view addSubview:taskTagView];
    
    [UIView animateWithDuration:0.5 animations:^{
        taskTagView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 200, [UIScreen mainScreen].bounds.size.width, 200);
    }];
}

- (void)onNewTagClicked
{
    WeakSelf()
    UIAlertController * alertCtrl = [UIAlertController alertControllerWithTitle:@"输入标题"
                                                                        message:@""
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    
    [alertCtrl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.placeholder = @"输入标签";
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         
                                                         NSArray * tf = alertCtrl.textFields;
                                                         UITextField *field = tf.firstObject;
                                                         [weakSelf handleAddTag:field.text];
                                                         
        
    }];
    UIAlertAction *canselAction = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertCtrl addAction:okAction];
    [alertCtrl addAction:canselAction];
    
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UINavigationController *navVC = (UINavigationController *)appDelegate.window.rootViewController;
    UIViewController *vc = navVC.visibleViewController;
    
    [vc presentViewController:alertCtrl animated:YES completion:nil];
}

- (void)handleAddTag:(NSString *)txt
{
    [self.tagBtn setTitle:txt forState:UIControlStateNormal];
}

@end
