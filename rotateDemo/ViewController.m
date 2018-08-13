//
//  ViewController.m
//  rotateDemo
//
//  Created by shs-ios on 15/8/21.
//  Copyright (c) 2015年 shs-ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scroll;
    UIImageView *_image;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 1400, 1400)];
    imageView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height);
    imageView.image = [UIImage imageNamed:@"bg.jpg"];
    [self.view addSubview:imageView];
    _image = imageView;
    _image.layer.anchorPoint = CGPointMake(0.5,0.5);
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scroll.contentSize = CGSizeMake(self.view.bounds.size.width*4, self.view.bounds.size.height);
    scroll.delegate = self;
    scroll.backgroundColor = [UIColor clearColor];
    scroll.bounces = NO;
    scroll.pagingEnabled = YES;
    [self.view addSubview:scroll];
    scroll.userInteractionEnabled = YES;
    _scroll = scroll;

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"angle1 =%f",scrollView.contentOffset.x);
    double angle = scrollView.contentOffset.x*90/self.view.bounds.size.width;
    NSLog(@"angle2 =%f",angle);
    
    _image.transform = CGAffineTransformMakeRotation((-angle * M_PI) / 180.0f);
//    _image.transform = CGAffineTransformMakeRotation(-angle);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
