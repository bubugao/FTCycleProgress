//
//  FTCycleView.m
//  StudyDemo
//
//  Created by xiaodou on 2016/10/28.
//  Copyright © 2016年 xiaodouxiaodou. All rights reserved.
//

#import "FTCycleView.h"

@interface FTCycleView () {
    CGFloat preProgress;       /**< 先前进度 */
}

@end

@implementation FTCycleView

#pragma mark - get

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        preProgress = 0;
        _fillColor = [UIColor  clearColor];
        _strokeColor = [UIColor greenColor];
        _lineWidth = 10;
    }
    return self;
}

- (UILabel *)progresslabel {
    if (_progresslabel == nil) {
        _progresslabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.8, self.frame.size.height*0.4)];
        _progresslabel.textAlignment = NSTextAlignmentCenter;
        _progresslabel.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [_progresslabel setFont:[UIFont systemFontOfSize:10.0*(self.frame.size.width/35.0)]];
        [self addSubview:_progresslabel];
    }
    return _progresslabel;
}


#pragma mark - public

/** 绘制环形进度条
 progress:进度值 0~1.0
 */
- (void)drawCycleProgress:(CGFloat)progress {
    self.progresslabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
    
    // 获取环形路径 （画一个圆 填充色透明 设置线框宽度为10，获得环形）
    CAShapeLayer *progressLayer = [CAShapeLayer layer];
    progressLayer.frame = self.bounds;
    progressLayer.fillColor = self.fillColor.CGColor;              // 填充颜色
    progressLayer.strokeColor = self.strokeColor.CGColor;          // 边框路径颜色
    //    _progressLayer.opacity = 1;                              // 背景颜色的透明度
    progressLayer.lineCap = kCALineCapRound;                       // 线的边缘是圆的
    progressLayer.lineWidth = self.lineWidth;                      // 线的宽度
    
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.width/2);
    CGFloat radius = self.frame.size.width/2;
    CGFloat startA = - M_PI_2 + M_PI*2*preProgress;
    CGFloat endA = - M_PI_2 + M_PI*2*progress;
    preProgress = progress;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius
                                                    startAngle:startA endAngle:endA clockwise:YES];
    progressLayer.path = path.CGPath;
    [self.layer addSublayer: progressLayer];
    
    // 动画效果
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    animation.duration = 0.1;
    [progressLayer addAnimation:animation forKey:nil];
}

@end
