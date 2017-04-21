//
//  LQTSlider.m
//  mySlider
//
//  Created by 李前途 on 2017/4/21.
//  Copyright © 2017年 李前途. All rights reserved.
//

#import "LQTSlider.h"
#import "LQTThumb.h"

@interface LQTSlider ()

@property (nonatomic,strong) LQTThumb *thumbView;

@end

@implementation LQTSlider

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self prepare];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}

- (NSInteger)thumbW{
    if (_thumbW) {
        return _thumbW;
    }
    
    return 22;
}

- (UIColor *)bgColor{
    if (_bgColor) {
        return _bgColor;
    }
    
    return [UIColor redColor];
}

- (UIColor *)thumbColor{
    if (_thumbColor) {
        return _thumbColor;
    }
    
    return [UIColor greenColor];
}

- (void)prepare{
    
    if (_bgImgName) {
        UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_bgImgName]];
        bg.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:bg];
    }
    
    _thumbView = [[LQTThumb alloc] initWithFrame:CGRectMake(0, 0, self.thumbW, self.frame.size.height)];
    _thumbView.backgroundColor = self.thumbColor;
    
    __block CAShapeLayer *shaowL = [self drawShadowView];
    [self.layer addSublayer:shaowL];
    __weak LQTSlider *weakSelf = self;
    _thumbView.thumbPos = ^(CGFloat x){
        NSLog(@"x-> %f",x);
        shaowL.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, x, weakSelf.bounds.size.height)].CGPath;
        [weakSelf setNeedsDisplay];
        
    };
    [self addSubview:_thumbView];
    
    self.backgroundColor = self.bgColor;

}

- (CAShapeLayer *)drawShadowView{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 0, self.bounds.size.height)];
    layer.path = path.CGPath;
    
    return layer;
}


@end
