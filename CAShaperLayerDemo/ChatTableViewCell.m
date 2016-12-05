//
//  ChatTableViewCell.m
//  CAShaperLayerDemo
//
//  Created by jiahao on 2016/12/5.
//  Copyright © 2016年 SILICN. All rights reserved.
//

#import "ChatTableViewCell.h"


@interface ChatTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *bubbleView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightCon;
@property (weak, nonatomic) IBOutlet UILabel *TextLab;


@end

@implementation ChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    NSString *str = @"这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，这事一段很长很长的文字，";
    NSString *subStr = [str substringToIndex:arc4random() % str.length];
    
    self.TextLab.text = subStr;
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSLog(@"layoutSubviews");
    
    
    if (self.isSender) {
        self.leftCon.constant = 80;
        self.rightCon.constant = 10;
    }else{
        self.leftCon.constant = 10;
        self.rightCon.constant = 80 ;
    }
}

- (void)setIsSender:(BOOL)isSender
{
    _isSender = isSender;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    NSLog(@"drawRect");
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [[UIColor cyanColor] set];
    
    
    if (self.isSender) {
        //起点
        [path moveToPoint:CGPointMake(0, 5)];
        //左上角圆弧
        [path addArcWithCenter:CGPointMake(5, 5) radius:5 startAngle:M_PI endAngle:M_PI*3/2 clockwise:YES];
        //上横线
        [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 5, 0)];
        //右上角圆弧
        [path addArcWithCenter:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 10, 5) radius:5 startAngle:M_PI*3/2 endAngle:0 clockwise:YES];
        //右竖线
        [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 5, 10)];
        
        //三角形
        [path addQuadCurveToPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 5, 16) controlPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame) + 5, 8)];
        //右竖线
        [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 5, CGRectGetHeight(self.bubbleView.frame) - 5)];
        
        //右下角圆弧
        [path addArcWithCenter:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 10, CGRectGetHeight(self.bubbleView.frame) - 5) radius:5 startAngle:0 endAngle:M_PI/2 clockwise:YES];
        //底部横线
        [path addLineToPoint:CGPointMake(5, CGRectGetWidth(self.bubbleView.frame))];
        
        //左下角圆弧
        [path addArcWithCenter:CGPointMake(5, CGRectGetWidth(self.bubbleView.frame) - 5) radius:5 startAngle:M_PI/2 endAngle:M_PI clockwise:YES];
        
        
    }else{
    
        //起始点
        [path moveToPoint:CGPointMake(5, 5)];
        //添加左上圆弧
        [path addArcWithCenter:CGPointMake(10, 5) radius:5 startAngle:M_PI endAngle:M_PI*3/2 clockwise:YES];
        //添加线到右上
        [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 5, 0)];
        //添加右上圆弧
        [path addArcWithCenter:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 5, 5) radius:5 startAngle:M_PI*3/2 endAngle:0 clockwise:YES];
        
        //添加线到右下
        [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame), CGRectGetHeight(self.bubbleView.frame) - 5)];
        //添加右下圆弧
        [path addArcWithCenter:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 5, CGRectGetHeight(self.bubbleView.frame) - 5) radius:5 startAngle:0 endAngle:M_PI/2 clockwise:YES];
        
        //添加线到左下
        [path addLineToPoint:CGPointMake(10, CGRectGetHeight(self.bubbleView.frame))];
        //添加左下圆弧
        [path addArcWithCenter:CGPointMake(10, CGRectGetHeight(self.bubbleView.frame) - 5) radius:5 startAngle:M_PI/2 endAngle:M_PI clockwise:YES];
        [path addLineToPoint:CGPointMake(5, 20)];
        [path addQuadCurveToPoint:CGPointMake(5, 13) controlPoint:CGPointMake(-5, 5)];
    }
    
    //封闭路径
    [path closePath];
    
    layer.path =  path.CGPath;

    self.bubbleView.layer.mask = layer;
    

}

@end
