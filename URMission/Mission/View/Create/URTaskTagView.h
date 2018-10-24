//
//  URTaskTagView.h
//  URMission
//
//  Created by lin weiyan on 2018/9/19.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TaskTagClickedCallback)(NSString *);

@interface URTaskTagView : UIView

@property (nonatomic, copy) TaskTagClickedCallback  taskTagClickedBlock;

@property (nonatomic, strong) NSArray<NSString *> *tagsArray;

@end
