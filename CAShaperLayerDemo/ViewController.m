//
//  ViewController.m
//  CAShaperLayerDemo
//
//  Created by jiahao on 2016/12/1.
//  Copyright © 2016年 SILICN. All rights reserved.
//

#import "ViewController.h"

#import "ChatTableViewCell.h"

#import "CureViewController.h"

#import "Staff.h"

#import "NSString+SLLimit.h"




@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *string = @"你好啊打算的阿斯顿哈斯哦";
    NSString *str1 = @"但还是低啊是1";
    NSString *str2 = @"大神解答&";
    NSString *str3 = @"打死还是345";
    
    NSLog(@"string = %@",[string isOnlyContainLimitChinese] ? @"是":@"否");
     NSLog(@"str1 = %@",[str1 isOnlyContainLimitChinese] ? @"是":@"否");
     NSLog(@"str2 = %@",[str2 isOnlyContainLimitChinese] ? @"是":@"否");
     NSLog(@"str3 = %@",[str3 isOnlyContainLimitChinese] ? @"是":@"否");
    
    
//    UITextView
////     NSLog(@"str = %@",[string isOnlyContainLimitChinese] ? @"是":@"否");
//    
//    
    [self.tableView registerNib:[UINib nibWithNibName:@"ChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"chatcell"];
    
    self.tableView.rowHeight = 110;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.dataSource = [NSMutableArray arrayWithCapacity:1];
    
    for (int i = 0; i < 20; i ++) {
        CGFloat height = arc4random() %110;
        if (height < 60) {
            height = 60;
        }
        [self.dataSource addObject:@(height)];
    }
    
    Staff *staff = [[Staff alloc]initWithName:@"小花" compy:@"北京"];
    
    NSLog(@"%@",staff.name);
    NSLog(@"list = %@",staff.compy);
    NSLog(@"合并分支");
    
    NSLog(@"姓名：%@   公司：%@",staff.name,staff.compy);
    
    NSLog(@"z-test");
    
    NSLog(@"this is nothing");
    
    NSLog(@"branch_1提交到分支 第2次");
    
    
    
    
    
    NSLog(@"branch_2提交到分支");
    
    
    
    NSLog(@"branch_1第三次提交分支");
    
    
    NSLog(@"branch_1第四次提交分支测试");
    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(30, 100, 200, 200)];
//    view.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:view];
//    view.center = self.view.center;
//    
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    
//   
//    //起始点
//    [path moveToPoint:CGPointMake(0, 5)];
//    //添加左上圆弧
//    [path addArcWithCenter:CGPointMake(5, 5) radius:5 startAngle:M_PI endAngle:M_PI*3/2 clockwise:YES];
//    
//    //添加线到右上
//    [path addLineToPoint:CGPointMake(145, 0)];
//    
//    //添加右上圆弧
//    [path addArcWithCenter:CGPointMake(145, 5) radius:5 startAngle:M_PI*3/2 endAngle:0 clockwise:YES];
//    
//    //添加三角形
//    [path addLineToPoint:CGPointMake(150, 15)];
//    
//    [path addLineToPoint:CGPointMake(158, 19)];
//    
//    [path addLineToPoint:CGPointMake(150, 23)];
//    
//    //添加线到右下
//    [path addLineToPoint:CGPointMake(150, 95)];
//    //添加右下圆弧
//    [path addArcWithCenter:CGPointMake(145, 95) radius:5 startAngle:0 endAngle:M_PI/2 clockwise:YES];
//    
//    //添加线到左下
//    [path addLineToPoint:CGPointMake(5, 100)];
//    //添加左下圆弧
//    [path addArcWithCenter:CGPointMake(5, 95) radius:5 startAngle:M_PI/2 endAngle:M_PI clockwise:YES];
//    
//    //封闭路径
//    [path closePath];
//    
//    layer.path = path.CGPath;
////    layer.lineCap = kCALineCapRound;
////    layer.lineWidth = 2;
////    layer.strokeColor = [UIColor redColor].CGColor;
////    
//    layer.fillColor = [UIColor redColor].CGColor;
//    
//    [view.layer addSublayer:layer];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  
{
    return [self.dataSource[indexPath.row] floatValue];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chatcell"];
    cell.isSender = arc4random()%100 %2;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CureViewController *vc = [CureViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
