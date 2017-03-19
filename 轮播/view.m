//
//  view.m
//  轮播
//
//  Created by Nnnd on 17/2/20.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "view.h"

@interface view()

@property(nonatomic,strong) UIColor *bgrColor;
@property(nonatomic,assign) NSInteger bgrAlpha;

@end

@implementation view

+ (instancetype)initWithBgrColor:(UIColor *)color bgrAlpha:(CGFloat) b
{
    view *v = [[view alloc] init];
    v.backgroundColor = [color colorWithAlphaComponent:b];
    return v;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
   
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path addArcWithCenter:CGPointMake(100, 200) radius:60 startAngle:0 endAngle:M_PI*2 clockwise:NO];
   
    path.lineWidth = 2;
    [path stroke];
    
   
}

@end
