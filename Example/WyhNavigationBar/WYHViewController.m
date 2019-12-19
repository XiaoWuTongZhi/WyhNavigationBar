//
//  WYHViewController.m
//  WyhNavigationBar
//
//  Created by 609223770@qq.com on 11/17/2019.
//  Copyright (c) 2019 609223770@qq.com. All rights reserved.
//

#import "WYHViewController.h"
#import <WyhNavigationBar.h>
#import <Masonry/Masonry.h>

@interface WYHViewController () <WyhNavigationBarDataSource>

@end

@implementation WYHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    WyhNavigationBar *naviBar = [WyhNavigationBar navigationBar];
//    naviBar.dataSource = self;
    WyhNavigationBarItem *leftItem = [[WyhNavigationBarItem alloc]initWithTitle:@"Left" addTarget:self action:@selector(unknown:)];
    WyhNavigationBarItem *rightItem1 = [[WyhNavigationBarItem alloc]initWithTitle:@"Right1" addTarget:self action:@selector(unknown:)];
    WyhNavigationBarItem *rightItem2 = [[WyhNavigationBarItem alloc]initWithTitle:@"Right2" addTarget:self action:@selector(unknown:)];
    naviBar.leftBarItems = @[leftItem];
    naviBar.rightBarItems = @[rightItem1,rightItem2];
    naviBar.title = @"TESTSDFKSLJALKJDLAJDADJAJD";
    
    [self.view addSubview:naviBar];
    [naviBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.left.right.equalTo(self.view);
        make.height.offset(WyhNavigationBar.barHeight);
    }];
    
    
    
}

//- (UIView *)navigationBarCustomTitleViewWithNavigationBar:(WyhNavigationBar *)navigationBar {
//
//    return ({
//        UIView *view = [[UIView alloc]init];
//        view.backgroundColor = [UIColor orangeColor];
//        view;
//    });
//}

@end
