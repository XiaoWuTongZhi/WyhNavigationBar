//
//  WyhNavigationBar.h
//  Arm
//
//  Created by wyh on 2018/8/30.
//  Copyright © 2018年 iTalkBB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WyhNavigationBarItem.h"

@class WyhNavigationBar;

@protocol WyhNavigationBarDataSource <NSObject>

@optional
- (UIView *)navigationBarCustomTitleViewWithNavigationBar:(WyhNavigationBar *)navigationBar;

@end


@interface WyhNavigationBar : UIView

@property (nonatomic, weak) id<WyhNavigationBarDataSource> dataSource;

@property (nonatomic, readonly) UIView *naviBar;

@property (nonatomic, readonly) UILabel *titleLabel;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong, readonly) UIView *titleView;//!< default is nil

@property (nonatomic, strong) NSArray<WyhNavigationBarItem *>*leftBarItems;

@property (nonatomic, strong) NSArray<WyhNavigationBarItem *>*rightBarItems;

+ (instancetype)navigationBar;

- (void)reload;

@end
