//
//  URCalenderMonthTableViewCell.m
//  URMission
//
//  Created by lin weiyan on 2018/8/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URCalenderMonthTableViewCell.h"
#import "URCalendarData.h"
#import "URMonthItemCollectionViewCell.h"
#import "URMonthInfoCollectionViewCell.h"

@interface URCalenderMonthTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView  *dayCollectionView;
@property (nonatomic, strong) NSArray           *itemArray;

@end

@implementation URCalenderMonthTableViewCell

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
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
//        layout.itemSize                    = CGSizeMake(35, 40);
        layout.sectionInset                = UIEdgeInsetsMake(3, 3, 3, 3);
//        layout.minimumInteritemSpacing     = 10.f; // 横向排列最小间距
        layout.minimumLineSpacing          = 5.0f; // 纵向排列最小间距
        
        self.dayCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        self.dayCollectionView.delegate = self;
        self.dayCollectionView.dataSource = self;
        self.dayCollectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.dayCollectionView];
        
        [self.dayCollectionView registerClass:[URMonthItemCollectionViewCell class]
                   forCellWithReuseIdentifier:@"URMonthItemCollectionViewCell"];
        
        [self.dayCollectionView registerClass:[URMonthInfoCollectionViewCell class]
                   forCellWithReuseIdentifier:@"URMonthInfoCollectionViewCell"];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.dayCollectionView.frame = self.bounds;
}

- (void)setItem:(URCalendarItem *)item
{
    _item = item;
    [self.dayCollectionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row < 7) {
//        return CGSizeMake(35, 30);
//    }
    return CGSizeMake(35, 40);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7 + _item.weekLine * 7;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 7) {
        
        URMonthItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"URMonthItemCollectionViewCell" forIndexPath:indexPath];
        if (indexPath.row == _item.startWeek) {
            NSUInteger m = _item.yMonth % 100;
            cell.day = @(m).stringValue;
        }
        else {
            cell.day = @"";
        }
        return cell;
    }
    else {
        URMonthInfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"URMonthInfoCollectionViewCell" forIndexPath:indexPath];

        if (indexPath.row > 7 + _item.startWeek - 1 && indexPath.row < 7 + _item.startWeek + _item.monthDay) {
            NSUInteger day = indexPath.row - 7 - _item.startWeek;
            cell.day = @(day + 1).stringValue;
        }
        else {
            cell.day = @"";
        }
        return cell;
    }
    
    return [UICollectionViewCell new];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return (self.bounds.size.width - 7 * 35)/8.0;
}

#pragma mark - delegate



@end
