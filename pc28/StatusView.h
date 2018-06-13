//
//  StatusView.h
//  pc28
//
//  Created by 83830 on 2016/11/18.
//  Copyright © 2016年 83830. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperViewController.h"

// 设备全屏高
#define SCREEN_FULL_HEIGHT  [[UIScreen mainScreen] bounds].size.height
// 设备全屏宽
#define SCREEN_FULL_WIDTH [[UIScreen mainScreen] bounds].size.width



#define interval 3

#define WIDTH_DYNAMIC(width)     width*1.0/375.0*SCREEN_FULL_WIDTH


@interface StatusView : UIView

@property (weak, nonatomic) SuperViewController  *viewController;

@property (copy, nonatomic) NSString  *url;

@property (assign, nonatomic) NSInteger  aaaaaaa;

@property (assign, nonatomic) NSInteger  type;

+ (StatusView *)shared;

-(void)showWithTitle:(NSString *)title;
-(void)dismiss;

-(void)qiehuanWithType:(NSInteger)type;

+(NSArray *)getStringssss:(NSString *)string type:(NSInteger)type;

-(void)selectBtnIndex:(NSInteger)index;


@end
