//
//  TempView.h
//  
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 liuhao. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TempView : UIView
/**
 *  圆被分切的个数
 */
@property (nonatomic,assign)NSInteger cutNum;

/**
 *  每个部分的颜色数组
 */
@property(nonatomic,strong)NSArray *colorArray;
/**
 *  中心点的View
 */
@property (nonatomic,weak)UIView *centerView;
/**
 *  画圆的起始位置   设置为12点方向
 */
@property (nonatomic,assign)CGFloat startAngle;

/**
 *  起始时中心View旋转的角度
 */
@property (nonatomic,assign) CGFloat starCenterPoint;

/**
 *  刷新的时间
 */
@property (nonatomic,assign) float loadTime;




@end
