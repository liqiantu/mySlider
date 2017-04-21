//
//  LQTThumb.h
//  mySlider
//
//  Created by 李前途 on 2017/4/21.
//  Copyright © 2017年 李前途. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UpdatePostion)(CGFloat pt);

@interface LQTThumb : UIView

@property (nonatomic,copy) UpdatePostion thumbPos;

@end
