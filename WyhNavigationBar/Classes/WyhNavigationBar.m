//
//  WyhNavigationBar.m
//  Arm
//
//  Created by wyh on 2018/8/30.
//  Copyright © 2018年 iTalkBB. All rights reserved.
//

#import "WyhNavigationBar.h"
#import <Masonry/Masonry.h>

static CGFloat kNavigationBarHeight = 0.f;
static CGFloat kStatusBarHeight = 0.f;

@interface WyhNavigationBar ()

@property (nonatomic, strong) UIView *titleView;

@property (nonatomic, strong) UIView *naviBar;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation WyhNavigationBar

+ (void)initialize {
    UINavigationController *navi = [[UINavigationController alloc]init];
    kNavigationBarHeight = navi.navigationBar.frame.size.height;
    
    kStatusBarHeight = UIApplication.sharedApplication.statusBarFrame.size.height;
}

+ (instancetype)navigationBar {
    
    WyhNavigationBar *navi = [[WyhNavigationBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kNavigationBarHeight + kStatusBarHeight)];
    return navi;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

#pragma mark - UI

- (void)configUI {
    
    _naviBar = ({
        UIView *naviBar = [[UIView alloc]init];
        naviBar.backgroundColor = [UIColor whiteColor];
        [self addSubview:naviBar];
        [naviBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(kStatusBarHeight);
            make.left.right.bottom.equalTo(self);            
        }];
        naviBar;
    });
    
    _titleView = ({
        UIView *view = [[UIView alloc]init];
        [_naviBar addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_naviBar.mas_left).offset(40.f);
            make.right.equalTo(_naviBar.mas_right).offset(-40.f);
            make.top.bottom.equalTo(_naviBar);
        }];
        view;
    });
    
    _titleLabel = ({
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:18.f];
        label.textAlignment = NSTextAlignmentCenter;
        [_titleView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_titleView);
        }];
        label;
    });
    
}

#pragma mark - Api

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
    self.titleLabel.center = self.titleView.center;
}

- (void)setLeftBarItems:(NSArray<WyhNavigationBarItem *> *)leftBarItems {
    [self.leftBarItems makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _leftBarItems = leftBarItems;
    [self reloadLeftBarItems];
}

- (void)setRightBarItems:(NSArray<WyhNavigationBarItem *> *)rightBarItems {
    [self.rightBarItems makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _rightBarItems = rightBarItems;
    [self reloadRightBarItems];
}

- (void)reload {
    [self.leftBarItems makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.rightBarItems makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self reloadLeftBarItems];
    [self reloadRightBarItems];
    [self reloadTitleView];
}

#pragma mark - Private

- (void)reloadTitleView {
    
    if ([self.dataSource respondsToSelector:@selector(navigationBarCustomTitleViewWithNavigationBar:)]) {
        [_titleView removeFromSuperview];
        [_titleLabel removeFromSuperview];
        _titleView = [self.dataSource navigationBarCustomTitleViewWithNavigationBar:self];
        [_naviBar addSubview:_titleView];
    }
    [_titleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_naviBar.mas_top);
        make.bottom.equalTo(_naviBar.mas_bottom);
        if (self.leftBarItems.lastObject) {
            make.left.equalTo(self.leftBarItems.lastObject.mas_right).offset(10.f);
        }else {
            make.left.equalTo(_naviBar.mas_left).offset(40.f);
        }
        if (self.rightBarItems.lastObject) {
            make.right.equalTo(self.rightBarItems.lastObject.mas_left).offset(-10.f);
        }else {
            make.right.equalTo(_naviBar.mas_right).offset(-40.f);
        }
    }];
}

- (void)reloadLeftBarItems {
    
    //left
    __block UIView *leftLastItem = nil;
    [self.leftBarItems enumerateObjectsUsingBlock:^(WyhNavigationBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.naviBar addSubview:obj];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            if (leftLastItem) {
                make.left.equalTo(leftLastItem.mas_right).offset(10.f);
            }else {
                make.left.equalTo(self.naviBar.mas_left).offset(12.f);
            }
            make.size.mas_equalTo(obj.size);
            make.centerY.equalTo(self.naviBar.mas_centerY);
        }];
        leftLastItem = obj;
    }];
}

- (void)reloadRightBarItems {

    //right
    __block UIView *rightLastItem = nil;
    [self.rightBarItems enumerateObjectsUsingBlock:^(WyhNavigationBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.naviBar addSubview:obj];
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            if (rightLastItem) {
                make.right.equalTo(rightLastItem.mas_left).offset(-10.f);
            }else {
                make.right.equalTo(self.naviBar.mas_right).offset(-12.f);
            }
            make.size.mas_equalTo(obj.size);
            make.centerY.equalTo(self.naviBar.mas_centerY);
        }];
        rightLastItem = obj;
    }];
}

#pragma mark - Methods

#pragma mark - Lazy

@end
