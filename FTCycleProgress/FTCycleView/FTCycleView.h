//
//  FTCycleView.h
//  StudyDemo
//
//  Created by xiaodou on 2016/10/28.
//  Copyright © 2016年 xiaodouxiaodou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTCycleView : UIView

@property (nonatomic, strong) UILabel *progresslabel;     /**< 显示进度的Label */
@property (nonatomic, strong) UIColor *fillColor;         /**< 填充颜色 */
@property (nonatomic, strong) UIColor *strokeColor;       /**< 边框路径颜色 */
@property (nonatomic, assign) CGFloat lineWidth;          /**< 线的宽度 */

/** 绘制环形进度条 
    progress:进度值 0~1.0
 */
- (void)drawCycleProgress:(CGFloat)progress;

@end
