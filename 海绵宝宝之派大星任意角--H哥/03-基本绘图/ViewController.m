//
//  ViewController.m
//  
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 liuhao. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()


/**
 *  随机生成的每一部分的颜色
 */
@property (nonatomic,strong)NSArray *colorArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.pathNum = 6;
    
    //颜色数组
    [self createColor];
    //中间的View界面
    [self loadViewForCenter];
}


//创建颜色

- (void)createColor
{
    NSMutableArray *nmArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < self.pathNum; i++) {
        UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        
        [nmArray addObject:color];
    }
    
    self.colorArray = nmArray;
    
}

//创建View

- (void)loadViewForCenter
{

    
    //创建显示的View
    TempView *tempView = [[TempView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    tempView.backgroundColor = [UIColor colorWithRed:0.7625 green:0.8462 blue:1.0 alpha:1.0];
    
    [self.view addSubview:tempView];
    
    self.tempView = tempView;
    
    tempView.colorArray = self.colorArray;
    
    self.tempView.startAngle = -M_PI_2;
    self.tempView.starCenterPoint = 0;
    self.tempView.loadTime = self.loadTime;
    self.tempView.cutNum = self.pathNum;

    tempView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.5];
    tempView.center = self.view.center;
    
    //创建View设置为大小1的点,作为偏移中心点的连线
    UIView *centerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];

    centerView.center = CGPointMake(tempView.bounds.size.width/ 2,tempView.bounds.size.height/ 2);

    tempView.centerView = centerView;
    centerView.backgroundColor = [UIColor redColor];
    
    //将中心View初始化的时候转向第一部分的中间
    centerView.transform = CGAffineTransformRotate(centerView.transform,M_PI /self.pathNum);
    
    [tempView addSubview:centerView];
}






@end
