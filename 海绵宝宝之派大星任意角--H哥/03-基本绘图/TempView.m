//
//  TempView.m
//  
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 liuhao. All rights reserved.
//

#import "TempView.h"

@interface TempView ()

/**
 *  计时器
 */
@property (nonatomic,strong)NSTimer *colorTimer;

@end

@implementation TempView


- (void)drawRect:(CGRect)rect {
    

    // 找到 宽和高一半最小的一个, 把这个计算的值, 当做 中心点和半径
    CGFloat centerX = self.frame.size.width/2;
    CGFloat centerY = self.frame.size.height/2;
    // 中心View的中心点
    CGPoint center = CGPointMake(centerX, centerY);
    
    
    
    // 起始位置, 结束位置
    //CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    
    CGAffineTransform centerTransForm = self.centerView.transform;
    
    //循环创建每一个扇形
    for (int i = 0; i < self.cutNum; i++) {
        
        //记录初始的transform
        self.centerView.transform = centerTransForm;
        
        CGFloat path = 1.0 / self.cutNum;
        
        endAngle = 2 * M_PI * path + self.startAngle;
        
        
//        // 绘制大圆形
        UIBezierPath *bezierBigPath = [UIBezierPath bezierPathWithArcCenter:center radius:[UIScreen mainScreen].bounds.size.width/2 startAngle:self.startAngle endAngle:endAngle clockwise:YES];
        
        // 向中心点添加一根线
        [bezierBigPath addLineToPoint:center];

        //非零绕数原则创建小圆
        UIBezierPath *bezierSmallPath = [UIBezierPath bezierPathWithArcCenter:center radius:([UIScreen mainScreen].bounds.size.width/2 - 20) startAngle:endAngle endAngle:self.startAngle clockwise:NO];
        
       //把中心View转向对应部分的中间 并向上偏移
       // self.starCenterPoint = 2 * M_PI /self.cutNum;
        self.centerView.transform = CGAffineTransformRotate(self.centerView.transform,i *(2 * M_PI /self.cutNum) + self.starCenterPoint);
        self.centerView.transform = CGAffineTransformTranslate(self.centerView.transform, 0, -50);
        
         CGPoint point =  CGPointMake(CGRectGetMaxX(self.centerView.frame), CGRectGetMaxY(self.centerView.frame));
        
        [bezierSmallPath addLineToPoint:point];

        //路径组合
        [bezierBigPath appendPath:bezierSmallPath];
        
        // 设置颜色
        [self.colorArray[i] setFill];
        
        [bezierBigPath fill];
        
        // 当一次绘制结束的时候
        self.startAngle = endAngle;

    }
    self.centerView.transform = centerTransForm;
    

 
}




//点击中心View触发的方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (nil == _colorTimer) {
        
        [self startcColorTimer];
    }
}

//开启定时器
- (void)startcColorTimer
{
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:self.loadTime target:self selector:@selector(loadViewForCenter) userInfo:nil repeats:YES];
    _colorTimer = timer;
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

//刷新中间的圆范围
- (void)loadViewForCenter
{
    [self changeColor];
    
    // 刷新
    [self setNeedsDisplay];
    
    _startAngle += -M_PI_4/6;
    
    _starCenterPoint += -M_PI_4/6;

    self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.5];
}

//刷新颜色数组创建颜色

- (void)changeColor
{
    NSMutableArray *nmArray = [[NSMutableArray alloc]init];
    
    [nmArray addObject:self.colorArray[self.cutNum - 1]];
    for (int i = 0; i < self.cutNum - 1; i++) {
        [nmArray addObject:self.colorArray[i]];
    }
    self.colorArray = nmArray;

    
}

@end
