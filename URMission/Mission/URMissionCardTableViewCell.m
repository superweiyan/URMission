//
//  URMissionCardTableViewCell.m
//  URMission
//
//  Created by lin weiyan on 2018/7/29.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMissionCardTableViewCell.h"
#import "URMissionType.h"
#import "Masonry.h"
#import "NSDate+Utils.h"

@interface URMissionCardTableViewCell()

@property (nonatomic, strong) UILabel       *missionTitle;
@property (nonatomic, strong) UILabel       *missionDesc;
@property (nonatomic, strong) UILabel       *startTime;
@property (nonatomic, strong) UILabel       *endTime;
@property (nonatomic, strong) UILabel       *classify;
@property (nonatomic, strong) UILabel       *prioriy;
@property (nonatomic, strong) UILabel       *lastTime;

@end

@implementation URMissionCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.missionTitle = [[UILabel alloc] init];
        [self addSubview:self.missionTitle];
        
        [self.missionTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.and.trailing.mas_equalTo(self);
            make.top.mas_equalTo(self).mas_offset(5);
            make.height.mas_equalTo(20);
        }];
        
        self.missionDesc = [[UILabel alloc] init];
        [self addSubview:self.missionDesc];
        
        [self.missionDesc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self);
            make.trailing.mas_equalTo(self);
            make.top.mas_equalTo(self.missionTitle.mas_bottom).mas_offset(5);
            make.height.mas_equalTo(50);
        }];

        self.startTime = [[UILabel alloc] init];
        [self addSubview:self.startTime];
        
        [self.missionTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self).mas_offset(5);
            make.width.mas_equalTo(100);
            make.top.mas_equalTo(self.missionDesc.mas_bottom).mas_offset(5);
            make.height.mas_equalTo(20);
        }];

        
        self.endTime = [[UILabel alloc] init];
        [self addSubview:self.endTime];
        
        [self.missionTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.trailing.mas_equalTo(self);
            make.top.mas_equalTo(self.missionDesc.mas_bottom).mas_offset(5);
            make.height.mas_equalTo(20);
        }];
    }
    return self;
}

- (void)setMissionModel:(URMissionModel *)missionModel
{
    _missionModel = missionModel;
    
    self.missionTitle.text = missionModel.missionName;
    self.missionDesc.text = missionModel.missionDesc;
    self.startTime.text = [NSDate converData:missionModel.startDate];
    self.endTime.text = [NSDate converData:missionModel.endDate];
}

@end
