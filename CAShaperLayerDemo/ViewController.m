//
//  ViewController.m
//  CAShaperLayerDemo
//
//  Created by jiahao on 2016/12/1.
//  Copyright © 2016年 SILICN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(30, 100, 200, 200)];
    view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view];
    view.center = self.view.center;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
   
    //起始点
    [path moveToPoint:CGPointMake(0, 5)];
    //添加左上圆弧
    [path addArcWithCenter:CGPointMake(5, 5) radius:5 startAngle:M_PI endAngle:M_PI*3/2 clockwise:YES];
    
    //添加线到右上
    [path addLineToPoint:CGPointMake(145, 0)];
    
    //添加右上圆弧
    [path addArcWithCenter:CGPointMake(145, 5) radius:5 startAngle:M_PI*3/2 endAngle:0 clockwise:YES];
    
    //添加三角形
    [path addLineToPoint:CGPointMake(150, 15)];
    
    [path addLineToPoint:CGPointMake(158, 19)];
    
    [path addLineToPoint:CGPointMake(150, 23)];
    
    //添加线到右下
    [path addLineToPoint:CGPointMake(150, 95)];
    //添加右下圆弧
    [path addArcWithCenter:CGPointMake(145, 95) radius:5 startAngle:0 endAngle:M_PI/2 clockwise:YES];
    
    //添加线到左下
    [path addLineToPoint:CGPointMake(5, 100)];
    //添加左下圆弧
    [path addArcWithCenter:CGPointMake(5, 95) radius:5 startAngle:M_PI/2 endAngle:M_PI clockwise:YES];
    
    //封闭路径
    [path closePath];
    
    layer.path = path.CGPath;
//    layer.lineCap = kCALineCapRound;
//    layer.lineWidth = 2;
//    layer.strokeColor = [UIColor redColor].CGColor;
//    
    layer.fillColor = [UIColor redColor].CGColor;
    
    [view.layer addSublayer:layer];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
