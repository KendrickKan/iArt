//
//  DrawView.h
//  SketchBookPro
//
//  Created by Janae on 15/12/18.
//  Copyright © 2015年 zhiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorPaletteView;
@interface DrawView : UIView
{
    NSMutableArray * _drawLines;
    ColorPaletteView * _colorPaletteView;
}
@end
