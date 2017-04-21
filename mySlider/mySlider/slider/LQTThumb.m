//
//  LQTThumb.m
//  mySlider
//
//  Created by 李前途 on 2017/4/21.
//  Copyright © 2017年 李前途. All rights reserved.
//

#import "LQTThumb.h"

@interface LQTThumb ()

@property (nonatomic,assign) CGPoint previousLocation;

@end

@implementation LQTThumb

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandle:)];
        [self addGestureRecognizer:pan];
        
    }
    return self;
}

- (void)panHandle:(UIPanGestureRecognizer *)gestureRecognizer{
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        _previousLocation = self.center;
    }
    
    CGPoint translation = [gestureRecognizer translationInView:self.superview];
    CGPoint newcenter = CGPointMake(_previousLocation.x + translation.x, _previousLocation.y + translation.y);
    
    float halfx = CGRectGetMidX(self.bounds);
    newcenter.x = MAX(halfx, newcenter.x);
    newcenter.x = MIN(self.superview.bounds.size.width - halfx, newcenter.x);
    
    float halfy = CGRectGetMidY(self.bounds);
    newcenter.y = MAX(halfy, newcenter.y);
    newcenter.y = MIN(self.superview.bounds.size.height - halfy, newcenter.y);
    
    self.center = newcenter;
    NSLog(@"th %f",self.center.x);
    self.thumbPos(self.center.x);
    
}

@end
