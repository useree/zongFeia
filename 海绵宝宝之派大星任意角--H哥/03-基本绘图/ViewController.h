//
//  ViewController.h
//  
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 liuhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TempView.h"
@interface ViewController : UIViewController
/**
 *  中心显示界面View
 */
@property (nonatomic,weak)TempView *tempView;

/**
 *  刷新的时间
 */
@property (nonatomic,assign) float loadTime;
/**
 *  角的个数
 */
@property (nonatomic,assign)NSInteger pathNum;

@end

