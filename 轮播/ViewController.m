//
//  ViewController.m
//  轮播
//
//  Created by Nnnd on 17/2/19.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "ViewController.h"
#import "view.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(strong,nonatomic)UIPageControl *page;
@property(strong,nonatomic)UIScrollView *scroll;
@property(strong,nonatomic)UIImageView *vieww;
@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
}

#pragma mark - private

- (void)setUpView
{
    CGRect screenRect = self.view.bounds;
    CGRect bigRect = screenRect;
    
    UIImageView *ima = [[UIImageView alloc]init];
    ima.frame = CGRectMake(0, 0,500,500);
    ima.image = [UIImage imageNamed:@"2.png"];
    self.vieww = ima;
    [self.view addSubview:ima];
    
    
    bigRect.size.width *= 2.0;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    
    scrollView.contentSize = CGRectMake(0, 0, 1000, screenRect.size.height).size;
    [scrollView setPagingEnabled:YES];
    
    self.scroll = scrollView;
    
    self.scroll.delegate = self;
    
    [self.view addSubview:scrollView];
    
    view *v = [view initWithBgrColor:[UIColor blueColor] bgrAlpha:0.3];
    v.frame = screenRect;
    
    screenRect.origin.x += screenRect.size.width;
    
    view *v1 = [view initWithBgrColor:[UIColor yellowColor] bgrAlpha:0.3];
    v1.frame = screenRect;
    
    [scrollView addSubview:v];
    [scrollView addSubview:v1];
    
    //页数控制
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    
    pageControl.frame = CGRectMake(150, 250, 20, 20);
    
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    
    self.page = pageControl;
    [self.view addSubview:pageControl];
    
    
    UIButton *a = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 50, 50)];
    [a setTitle:@"开始" forState:UIControlStateNormal];
    [self.view addSubview:a];
    UIButton *left = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 50, 30)];
    [left setTitle:@"左边" forState:UIControlStateNormal];
    [self.view addSubview:left];
    UIButton *right = [[UIButton alloc]initWithFrame:CGRectMake(250, 20, 50, 30)];
    [right setTitle:@"右边" forState:UIControlStateNormal];
    [self.view addSubview:right];

    
    
    
}



#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    NSInteger page1 = _scroll.contentOffset.x / (self.view.bounds.size.width-40);
    CGFloat a = _scroll.contentOffset.x / 10;
    self.vieww.transform = CGAffineTransformMakeTranslation(-a, 0);
    _page.currentPage = page1;
    
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    
    
}
@end
