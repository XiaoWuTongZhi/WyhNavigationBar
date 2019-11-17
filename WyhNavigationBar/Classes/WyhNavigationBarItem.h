//
//  WyhNavigationBarItem.h
//  Pods-WyhNavigationBar_Example
//
//  Created by wyh on 2019/11/17.
//

#import <UIKit/UIKit.h>


@interface WyhNavigationBarItem : UIView

@property (nonatomic, assign) CGSize size;

@property (nonatomic, strong) UIColor *tintColor;

@property (nonatomic, readonly) UIButton *barItemButton;

- (instancetype)initWithTitle:(NSString *)title addTarget:(id)target action:(SEL)action;

- (instancetype)initWithImage:(UIImage *)image addTarget:(id)target action:(SEL)action;

- (void)addTarget:(id)target action:(SEL)action;

@end

