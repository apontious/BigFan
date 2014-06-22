//
//  BigFanView.m
//  Big Fan
//
//  Created by Andrew Pontious on 6/21/14.
//  Copyright (c) 2014 Andrew Pontious. 
//  Some right reserved: http://opensource.org/licenses/mit-license.php
//

#import "BigFanView.h"

@interface BigFanView ()

@property (nonatomic) IBInspectable UIColor *fanBackgroundColor;
@property (nonatomic) IBInspectable UIColor *fanForegroundColor;

@property (nonatomic) UIView *fanView;

@end

@implementation BigFanView

- (void)setFanBackgroundColor:(UIColor *)fanBackgroundColor {
    _fanBackgroundColor = fanBackgroundColor;
    [self updateDisplay];
}
- (void)setFanForegroundColor:(UIColor *)fanForegroundColor {
    _fanForegroundColor = fanForegroundColor;
    [self updateDisplay];
}

- (void)updateDisplay {
    self.fanView.backgroundColor = self.fanForegroundColor;
    self.backgroundColor = self.fanBackgroundColor;
}

- (UIView *)fanView {
    // This needs to be available immediately for the setters, above, or the Interface Builder Live View won't *quite* work right. In my experience, it can't be set in, say, willMoveToWindow:.
    if (_fanView == nil) {
        _fanView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        
        _fanView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addSubview:_fanView];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_fanView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_fanView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_fanView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_fanView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        
        [self updateConstraintsIfNeeded];

        [self animateOneRotation];
    }
    
    return _fanView;
}

- (void)animateOneRotation {
    self.fanView.transform = CGAffineTransformIdentity;

    [UIView animateWithDuration:2 animations:^{
        self.fanView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);
        
    } completion:^(BOOL finished) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self animateOneRotation];
        });
    }];
}

@end
