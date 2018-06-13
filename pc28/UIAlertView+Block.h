//
//  UIAlertView+Block.h
//  yjcun
//
//  Created by linjiangfeng on 15/7/23.
//  Copyright (c) 2015年 linjiangfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertView_block_self_index)(UIAlertView *alertView, NSInteger btnIndex);
typedef void(^UIAlertView_block_self)(UIAlertView *alertView);
typedef BOOL(^UIAlertView_block_shouldEnableFirstOtherButton)(UIAlertView *alertView);

@interface UIAlertView (Block)

- (void)mc_handlerClickedButton:(UIAlertView_block_self_index)aBlock;
- (void)mc_handlerCancel:(UIAlertView_block_self)aBlock;
- (void)mc_handlerWillPresent:(UIAlertView_block_self)aBlock;
- (void)mc_handlerDidPresent:(UIAlertView_block_self)aBlock;
- (void)mc_handlerWillDismiss:(UIAlertView_block_self_index)aBlock;
- (void)mc_handlerDidDismiss:(UIAlertView_block_self_index)aBlock;
- (void)mc_handlerShouldEnableFirstOtherButton:(UIAlertView_block_shouldEnableFirstOtherButton)aBlock;

// 延时消失
- (void)mc_showWithDuration:(NSTimeInterval)i;
@end
