//
//  CureViewController.m
//  CAShaperLayerDemo
//
//  Created by jiahao on 2016/12/6.
//  Copyright © 2016年 SILICN. All rights reserved.
//

#import "CureViewController.h"

@interface CureViewController ()

@end

@implementation CureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Cure";
    
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(50, 200, 200, 200)];
    v.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:v];
    
    
       
    
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(5, 5)];
//    
//    [path moveToPoint:CGPointMake(100, 10)];
//    
//    [path addQuadCurveToPoint:CGPointMake(100, 20) controlPoint:CGPointMake(115, 5)];
//    
//    layer.path = path.CGPath;
//    
//    layer.fillColor = [UIColor redColor].CGColor;
//    
//    [v.layer addSublayer:layer];
//    
//    
//    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
//    label.text = @"测试";
//   // label.backgroundColor = [UIColor orangeColor];
//    [v addSubview:label];
//
    
    
    //画动态圆
    CAShapeLayer *aLayer = [CAShapeLayer layer];
    aLayer.lineWidth = 5;
    aLayer.strokeColor = [UIColor redColor].CGColor;
    aLayer.fillColor = [UIColor clearColor].CGColor;
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    [aPath addArcWithCenter:CGPointMake(100, 100) radius:80 startAngle:0 endAngle:M_PI *4 /2 clockwise:YES];
    aLayer.path = aPath.CGPath;
    [v.layer addSublayer:aLayer];
    
    CABasicAnimation *bas = [CABasicAnimation animationWithKeyPath :NSStringFromSelector ( @selector (strokeEnd))];  
    bas.duration = 8;  
    bas.fromValue = [NSNumber numberWithInteger:0];  
    bas.toValue = [NSNumber numberWithFloat:M_PI *4 /2];  
    [aLayer addAnimation:bas forKey:NSStringFromSelector ( @selector (strokeEnd))];  
    
    
  

    
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
