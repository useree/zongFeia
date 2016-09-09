//
//  RootViewController.m
//  
//
//  Created by liuhao on 16/8/5.
//  Copyright © 2016年 liuhao. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"

@interface RootViewController ()
/**
 *  圆被裁减的个数
 */
@property (weak, nonatomic) IBOutlet UITextField *pathNumField;

/**
 *  颜色旋转时间的输入框
 */
@property (weak, nonatomic) IBOutlet UITextField *colorTimefield;

/**
 *  绘制星星按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *button;




@end

@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    //添加监测textFiled的实时输入
    [_pathNumField addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventEditingChanged];
    
    [_colorTimefield addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventEditingChanged];

    
}


/**
 *  监测输入框的变化改变Button的状态
 */
- (void)changeValue
{
    if (_pathNumField.text.length > 0 && _colorTimefield.text.length > 0) {
        
        self.button.enabled = YES;
    }
    
}

//星星界面入栈
- (IBAction)clickButton:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"push" sender:nil];
}

//界面跳转调用此方法传递值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController *starController = segue.destinationViewController;
    
    starController.pathNum = [self.pathNumField.text integerValue];
    
    starController.loadTime = 1.0/[self.colorTimefield.text intValue];
    
}

@end
