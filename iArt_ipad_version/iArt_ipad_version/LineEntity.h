//
//  LineEntity1.h
//  SketchBookPro
//
//  Created by Janae on 15/12/18.
//  Copyright © 2015年 zhiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LineEntity : NSObject
@property(nonatomic, strong)NSMutableArray  * points;
@property(nonatomic, strong)UIColor         * color;
@property(nonatomic, assign)int             width;

-(id)initWithColor:(UIColor *)color width:(int)width;

@end
