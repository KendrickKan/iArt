//
//  LineEntity1.m
//  SketchBookPro
//
//  Created by Janae on 15/12/18.
//  Copyright © 2015年 zhiyuan. All rights reserved.
//

#import "LineEntity.h"

@implementation LineEntity
-(id)initWithColor:(UIColor *)color width:(int)width {
    self = [super init];
    if (self) {
        
        _points = [[NSMutableArray alloc]init];
        _color = color;
        _width = width;
    }
    return self;
}
@end
