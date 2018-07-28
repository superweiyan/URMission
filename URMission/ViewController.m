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

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

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
}

- (void)initViews
{
    self.missionTableview = [[UITableView alloc] init];
    self.missionTableview.delegate = self;
    self.missionTableview.dataSource = self;
    [self.view addSubview:self.missionTableview];

    [self.missionTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)loadData
{
    
}

- (void)addMission
{
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"任务" style:UIBarButtonItemStylePlain target:self action:@selector(onAddMission)];
    self.navigationItem.rightBarButtonItem = right;
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
    
}

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
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
    self.
}


@end
