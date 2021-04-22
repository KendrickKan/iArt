//
//  ColorPaletteView.m
//  SketchBookPro
//
//  Created by Janae on 15/12/18.
//  Copyright © 2015年 zhiyuan. All rights reserved.
//

#import "ColorPaletteView.h"

@implementation ColorPaletteView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 红色盘
        _rSlider = [[UISlider alloc] initWithFrame:CGRectMake(180, -20, CGRectGetWidth(self.frame)-340, 40)];
        _rSlider.thumbTintColor = [UIColor redColor];
        _rSlider.minimumTrackTintColor = [UIColor redColor];
        [_rSlider addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_rSlider];
        
        // 绿色盘
        _gSlider = [[UISlider alloc] initWithFrame:CGRectMake(CGRectGetMinX(_rSlider.frame), CGRectGetMaxY(_rSlider.frame), CGRectGetWidth(_rSlider.frame), CGRectGetHeight(_rSlider.frame))];
        _gSlider.thumbTintColor = [UIColor greenColor];
        _gSlider.minimumTrackTintColor = [UIColor greenColor];
        [_gSlider addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_gSlider];
        
        // 蓝色盘
        _bSlider = [[UISlider alloc] initWithFrame:CGRectMake(CGRectGetMinX(_gSlider.frame), CGRectGetMaxY(_gSlider.frame), CGRectGetWidth(_gSlider.frame), CGRectGetHeight(_gSlider.frame))];
        _bSlider.thumbTintColor = [UIColor blueColor];
        _bSlider.minimumTrackTintColor = [UIColor blueColor];
        [_bSlider addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_bSlider];
        
        // 宽度
        _wSlider = [[UISlider alloc] initWithFrame:CGRectMake(CGRectGetMinX(_bSlider.frame), CGRectGetMaxY(_bSlider.frame), CGRectGetWidth(_bSlider.frame), CGRectGetHeight(_bSlider.frame))];
        [_wSlider addTarget:self action:@selector(changeWidth:) forControlEvents:UIControlEventValueChanged];
        [_wSlider setMinimumValue:1.0];
        [_wSlider setMaximumValue:9.9];
        [self addSubview:_wSlider];

        // 调色盘
        _pView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.frame)-105, CGRectGetMinY(_rSlider.frame)+5, 80, 70)];
        _pView.layer.cornerRadius = 30;
        _pView.layer.masksToBounds = YES;
        [self addSubview:_pView];
        
        // 显示宽度
        _wLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_pView.frame)-40, CGRectGetMaxY(_bSlider.frame), 60, 30)];
        [self addSubview:_wLabel];
        
        
        [_wLabel setText:@"线宽1.0"];
        _pView.backgroundColor = [UIColor blackColor];
        _seletedColor = [UIColor blackColor];
        _seletedWidth = 1;
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setFrame:CGRectMake(730, 80, 40, 30)];
        //[button setFrame:CGRectMake(CGRectGetMaxX(_wLabel.frame), CGRectGetMinY(_wLabel.frame), 40, 30)];
        //[button setBackgroundColor:[UIColor lightGrayColor]];
        [button setTitle:@"橡皮" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clean:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
    }
    return self;
}

- (void)clean:(id)sender{
    self.seletedColor = [UIColor whiteColor];
}


- (void)changeColor:(id)sender{
    UIColor * color = [UIColor colorWithRed:_rSlider.value green:_gSlider.value blue:_bSlider.value alpha:1.0];
    [_pView setBackgroundColor:color];
    
    if (_seletedColor != color) {  //如果原来的颜色不等于现在的
        _seletedColor = color;
    }
    
}
- (void)changeWidth:(id)sender{
    UISlider * slider =(UISlider *)sender;
    [_wLabel setText:[NSString stringWithFormat:@"线宽%.1f",slider.value]];
    _seletedWidth = slider.value;
    
}

@end
