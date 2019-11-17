//
//  WyhNavigationBarItem.m
//  Pods-WyhNavigationBar_Example
//
//  Created by wyh on 2019/11/17.
//

#import "WyhNavigationBarItem.h"

@interface WyhNavigationBarItem ()

@property (nonatomic, strong) UIButton *barItemButton;

@end

@implementation WyhNavigationBarItem

- (instancetype)initWithTitle:(NSString *)title addTarget:(id)target action:(SEL)action {
    
    if (self = [super init]) {
        [self configUI];
        [_barItemButton setTitle:title forState:(UIControlStateNormal)];
        [self updateSubviewsBounds];
        [self addTarget:target action:action];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image addTarget:(id)target action:(SEL)action {
    if (self = [super init]) {
        [self configUI];
        [_barItemButton setImage:image forState:(UIControlStateNormal)];
        [self updateSubviewsBounds];
        [self addTarget:target action:action];
    }
    return self;
}

- (void)configUI {
    UIButton *sender = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _barItemButton = sender;
    sender.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [sender setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [self addSubview:sender];
}

- (void)updateSubviewsBounds {
    
    [self.barItemButton sizeToFit];
    
    CGRect bounds = self.barItemButton.bounds;
    if (bounds.size.height > [self maxBarItemHeight]) {
        bounds.size.height = [self maxBarItemHeight];
    }
    
    if (bounds.size.width < [self minBarItemWidth]) {
        bounds.size.width = [self minBarItemWidth];
    }
    
    self.barItemButton.bounds = bounds;
    self.barItemButton.frame = bounds;
    self.bounds = self.barItemButton.bounds;
}

- (void)addTarget:(id)target action:(SEL)action {
    [self.barItemButton addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
    
    if (_barItemButton.imageView.image) {
        UIImage *oldImage = self.barItemButton.imageView.image;
        UIImage *supportTintImage = [oldImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_barItemButton setImage:supportTintImage forState:(UIControlStateNormal)];
        [_barItemButton setTintColor:tintColor];
    }
    if (_barItemButton.titleLabel.text) {
        [_barItemButton setTitleColor:tintColor forState:(UIControlStateNormal)];
    }
    
}

- (CGFloat)minBarItemWidth {
    return 30.f;
}

- (CGFloat)maxBarItemHeight {
    return 44.f;
}

- (CGSize)size {
    return self.bounds.size;
}

@end
