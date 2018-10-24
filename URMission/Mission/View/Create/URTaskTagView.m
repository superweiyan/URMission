//
//  URTaskTagView.m
//  URMission
//
//  Created by lin weiyan on 2018/9/19.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URTaskTagView.h"

@interface URTaskTagView()<UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIButton              *closeBtn;
@property (nonatomic, strong) UICollectionView      *tagCollection;

@end

@implementation URTaskTagView

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
        self.closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width - 30 - 5, 0, 30, 30)];
        self.closeBtn.backgroundColor = [UIColor redColor];
        [self.closeBtn addTarget:self action:@selector(onCloseClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.closeBtn];
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 5.0f; // 纵向排列最小间距
        layout.minimumInteritemSpacing = 10.0f; // 横向排列最小间距
        
        self.tagCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40, self.bounds.size.width, self.bounds.size.height - 45) collectionViewLayout:layout];
        
        self.tagCollection.delegate = self;
        self.tagCollection.dataSource = self;
        self.tagCollection.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.tagCollection];
        
        [self.tagCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return self;
}

- (void)setTagsArray:(NSArray<NSString *> *)tagsArray
{
    _tagsArray = tagsArray;
    [self.tagCollection reloadData];
}

- (void)onCloseClicked:(id)sender
{
    [self removeFromSuperview];
}

#pragma mark -

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(50, 30);
}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tagsArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

@end
