//
//  WYHViewController.m
//  WyhNavigationBar
//
//  Created by 609223770@qq.com on 11/17/2019.
//  Copyright (c) 2019 609223770@qq.com. All rights reserved.
//

#import "WYHViewController.h"
#import <WyhNavigationBar.h>

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
    WyhNavigationBarItem *rightItem = [[WyhNavigationBarItem alloc]initWithTitle:@"Right" addTarget:self action:@selector(unknown:)];
    naviBar.leftBarItems = @[leftItem];
    naviBar.rightBarItems = @[rightItem];
    naviBar.title = @"TEST";
    [self.view addSubview:naviBar];
//    [naviBar reload];
    
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
