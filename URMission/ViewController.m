//
//  ViewController.m
//  URMission
//
//  Created by lin weiyan on 2018/7/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "URMissionAddView.h"
#import "URCommonMarco.h"
#import "URRotationPresentAnimation.h"
#import "URAddMissionViewController.h"
#import "URMissionCardTableViewCell.h"
#import "URMissionModule.h"
#import "URMissionType.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView   *missionTableview;
@property (nonatomic, strong) NSArray       *missionItemArray;

@property(nonatomic,strong) URRotationPresentAnimation *presentAnimation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.delegate = self;
    [self initViews];
    [self loadData];
    [self addMission];
    [self initNotification];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)initViews
{
    self.missionTableview = [[UITableView alloc] init];
    self.missionTableview.delegate = self;
    self.missionTableview.dataSource = self;
    [self.view addSubview:self.missionTableview];
    
    [self.missionTableview registerClass:[URMissionCardTableViewCell class] forCellReuseIdentifier:@"URMissionCardTableViewCellIndentifier"];

    [self.missionTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)loadData
{
    self.missionItemArray = [[URMissionModule sharedObject] getMission];
    [self.missionTableview reloadData];
}

- (void)addMission
{
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"任务" style:UIBarButtonItemStylePlain target:self action:@selector(onAddMission)];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)initNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onURMissionAddNotification:) name:kURMissionAddNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [URRotationPresentAnimation animationWithAnimationType:AnimationTypeNavPush];
    }else if(operation == UINavigationControllerOperationPop){
        return [URRotationPresentAnimation animationWithAnimationType:AnimationTypeNavPop];
    }else {
        return nil;
    }
    return nil;
}


#pragma mark - modal transition animation delegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source{
    return [URRotationPresentAnimation animationWithAnimationType:AnimationTypeModalPresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    return [URRotationPresentAnimation animationWithAnimationType:AnimationTypeModalDismiss];
}

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.missionItemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    URMissionCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"URMissionCardTableViewCellIndentifier"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

#pragma mark - add mission

- (void)onAddMission
{
//    //TODO ： 换成转场动画的方式
//    WeakSelf
//    URMissionAddView *missionView = [URMissionAddView showMissionView];
//    [self.view addSubview:missionView];
//    CGFloat x = (self.view.bounds.size.width - missionView.bounds.size.width ) / 2;
//    missionView.frame = CGRectMake(x,
//                                   self.view.bounds.size.height,
//                                   missionView.bounds.size.width,
//                                   missionView.bounds.size.height);
//
//    [UIView animateWithDuration:1 animations:^{
//        missionView.center = weakSelf.view.center;
//    }];
    
    URAddMissionViewController *controller = [[URAddMissionViewController alloc] init];
    controller.transitioningDelegate = self;
    [self presentViewController:controller animated:NO completion:nil];
}


@end
