//
//  ColorPaletteView.h
//  SketchBookPro
//
//  Created by Janae on 15/12/18.
//  Copyright © 2015年 zhiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorPaletteView : UIView
{
    UISlider * _rSlider;    // 红
    UISlider * _gSlider;    // 绿
    UISlider * _bSlider;    // 蓝
    UISlider * _wSlider;    // 线宽
    
    UIView  * _pView;        // 调色板
    UILabel * _wLabel;      // 线宽显示
}

/// 改变宽度方法
- (void)changeWidth:(id)sender;

/// 选中的颜色
@property(nonatomic,retain)UIColor * seletedColor;

/// 选中的宽度
@property(nonatomic,assign)float seletedWidth;


@end
