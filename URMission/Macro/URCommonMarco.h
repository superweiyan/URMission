//
//  URCommonMarco.h
//  URFLLearn
//
//  Created by lin weiyan on 2018/5/4.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WeakSelf() __weak __typeof(self) weakSelf = self;


#define JumpViewController(name)    id cls = [[NSClassFromString(name) alloc] init]; \
                                    if ([cls isKindOfClass:[UIViewController class]]) { \
                                        [self.navigationController pushViewController:cls animated:YES]; \
                                    } \
                                    else { \
NSLog(@"jumpViewController fail"); \
                                    }



#define GetViewWidth()  self.view.bounds.size.width

#define BarButton_Target(Title,Target,Selector) [[UIBarButtonItem alloc] initWithTitle:Title \
                                        style:UIBarButtonItemStylePlain target:Target action:Selector]

#define Btn_Click(Btn, Selector, ControlEvents) [Btn addTarget:self action:Selector forControlEvents:ControlEvents];

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
            green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
            blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
            alpha:1.0]
