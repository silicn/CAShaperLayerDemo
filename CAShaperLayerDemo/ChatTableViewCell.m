//
//  ChatTableViewCell.m
//  CAShaperLayerDemo
//
//  Created by jiahao on 2016/12/5.
//  Copyright © 2016年 SILICN. All rights reserved.
//

#import "ChatTableViewCell.h"


@interface ChatTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bubbleView;

@end

@implementation ChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)drawRect:(CGRect)rect
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [[UIColor cyanColor] set];
    //起始点
    [path moveToPoint:CGPointMake(5, 5)];
    //添加左上圆弧
    [path addArcWithCenter:CGPointMake(10, 5) radius:5 startAngle:M_PI endAngle:M_PI*3/2 clockwise:YES];
    
    //添加线到右上
    [path addLineToPoint:CGPointMake(145, 0)];
    
    
    
    //添加右上圆弧
    [path addArcWithCenter:CGPointMake(145, 5) radius:5 startAngle:M_PI*3/2 endAngle:0 clockwise:YES];
    
    
    //添加线到右下
    [path addLineToPoint:CGPointMake(150, 95)];
    //添加右下圆弧
    [path addArcWithCenter:CGPointMake(145, 95) radius:5 startAngle:0 endAngle:M_PI/2 clockwise:YES];
    
    //添加线到左下
    [path addLineToPoint:CGPointMake(10, 100)];
    //添加左下圆弧
    [path addArcWithCenter:CGPointMake(10, 95) radius:5 startAngle:M_PI/2 endAngle:M_PI clockwise:YES];
    
    [path addLineToPoint:CGPointMake(5, 20)];
    
    [path addQuadCurveToPoint:CGPointMake(5, 13) controlPoint:CGPointMake(-5, 5)];
    
    //封闭路径
    [path closePath];
    
    layer.path =  path.CGPath;

    self.bubbleView.layer.mask = layer;
    

}

@end
