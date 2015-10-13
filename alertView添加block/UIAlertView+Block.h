//
//  UIAlertView+Block.h
//  alertView添加block
//
//  Created by 141319 on 15/10/12.
//  Copyright © 2015年 141319. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Block)
/**
 *  此方法用来替换 [alert show] 方法 +
 [alertView clickedButtonAtIndex:] 代理方法

 *
 *  @param completionHandler 回调
 */
- (void)showWithCompletionHandler:(void(^)(NSUInteger buttonIndex))completionHandler;


@end
