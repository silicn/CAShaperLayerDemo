//
//  ChatTableViewCell.m
//  CAShaperLayerDemo
//
//  Created by jiahao on 2016/12/5.
//  Copyright © 2016年 SILICN. All rights reserved.
//

#import "ChatTableViewCell.h"


@interface ChatTableViewCell ()

@property (weak, nonatomic) IBOutlet UIControl *bubbleView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightCon;
@property (weak, nonatomic) IBOutlet UILabel *TextLab;

@property (weak, nonatomic) IBOutlet UIImageView *avatarIMG;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avRightCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avLeftCon;



@end

@implementation ChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    NSString *str = @"这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，这是一段很长很长的文字，";
//    NSString *subStr = [str substringToIndex:arc4random() % str.length];
    
    self.TextLab.text = str;
    
    
    [self.bubbleView addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.bubbleView addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    
    [self.bubbleView addTarget:self action:@selector(touchCancle:) forControlEvents:UIControlEventTouchCancel];
    
    
    UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(press:)]; 
    
    [self.bubbleView addGestureRecognizer:press];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuWillHidden:) name:UIMenuControllerWillHideMenuNotification object:nil];
    
    
    
    
    // Initialization code
}


- (void)press:(UILongPressGestureRecognizer *)press
{
    if (press.state == UIGestureRecognizerStateBegan) {
        press.view.backgroundColor = [UIColor redColor];
        self.TextLab.textColor = [UIColor whiteColor];
        [self becomeFirstResponder];
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        CGPoint point = [press locationInView:self.bubbleView];
        
        NSLog(@" point = %@",NSStringFromCGPoint(point));
        
        [menu setTargetRect:CGRectMake(point.x - 100, 0, 200, 40) inView:self.bubbleView];
        [menu setMenuVisible:YES animated:YES];

    }else if (press.state == UIGestureRecognizerStateEnded || press.state == UIGestureRecognizerStateCancelled){
       // press.view.backgroundColor = [UIColor colorWithRed:252/255.0 green:90/255.0 blue:156/255.0 alpha:1.0];
    }
}

- (void)menuWillHidden:(NSNotification  *)not
{
    self.bubbleView.backgroundColor = [UIColor colorWithRed:252/255.0 green:90/255.0 blue:156/255.0 alpha:1.0];
    self.TextLab.textColor = [UIColor blackColor];
    
}

- (void)touchUpInside:(UIControl *)view
{
    
}

- (void)touchDown:(UIControl *)view
{
       
    
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copy:)) {
        return YES;
    }
    
    if (action == @selector(delete:)) {
        return YES;
    }
    return NO;
}

- (void)touchCancle:(UIControl *)view
{
   
}


- (void)copy:(id)sender
{
    
}


- (void)delete:(id)sender
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSLog(@"layoutSubviews  %@",NSStringFromCGRect(self.frame));
    
    self.leftCon.constant = self.isSender?80:48;
    self.rightCon.constant = self.isSender?48:80;
    
    self.avLeftCon.constant = self.isSender?-self.frame.size.width + 56:0;
 
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
        [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 5, 13)];
        //三角形
        [path addQuadCurveToPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 5, 20) controlPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame) + 5, 5)];
        //右竖线
        [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 5, CGRectGetHeight(self.bubbleView.frame) - 5)];
        //右下角圆弧
        [path addArcWithCenter:CGPointMake(CGRectGetWidth(self.bubbleView.frame) - 10, CGRectGetHeight(self.bubbleView.frame) - 5) radius:5 startAngle:0 endAngle:M_PI/2 clockwise:YES];
        //底部横线
        [path addLineToPoint:CGPointMake(5, CGRectGetWidth(self.bubbleView.frame))];
        
        //左下角圆弧
        [path addArcWithCenter:CGPointMake(5, CGRectGetHeight(self.bubbleView.frame) - 5) radius:5 startAngle:M_PI/2 endAngle:M_PI clockwise:YES];
        
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


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
