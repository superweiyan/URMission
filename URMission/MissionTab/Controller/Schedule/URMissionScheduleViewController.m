//
//  URMissionScheduleViewController.m
//  URMission
//
//  Created by lin weiyan on 2018/10/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMissionScheduleViewController.h"
#import "URNewMissionViewController.h"
#import "URCommonMarco.h"
#import "URCalendarView.h"
#import "Masonry.h"
#import "URMissionModule.h"
#import "URMissionModel.h"


@interface URMissionScheduleViewController ()

@property (nonatomic, strong)  URCalendarView *calenderView;

@end

@implementation URMissionScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViews];
    [self loadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)initViews
{
    UIBarButtonItem *item = BarButton_Target(@"创建", self, @selector(onCreateClicked));
    self.navigationItem.rightBarButtonItem = item;
    
    self.calenderView = [[URCalendarView alloc] init];
    [self.view addSubview:self.calenderView];
    CGFloat h = [URCalendarView getHeightForDate:[NSDate date]];
    
    [self.calenderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view);
        make.trailing.mas_equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        }
        else {
            make.top.mas_equalTo(self.view);
        }
        make.height.mas_equalTo(h);
    }];
}

- (void)onCreateClicked
{
    self.navigationController.hidesBottomBarWhenPushed = YES;
    JumpViewController(@"URNewMissionViewController");
}

- (void)loadData
{
    [[URMissionModule shareInstance] loadMission:[NSDate date] callback:^(int32_t result,
                                                                          NSArray<URMissionInfo *> *infoArray){
        if (result) {
            
        }
    }];
}

@end
