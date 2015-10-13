//
//  UIAlertView+Block.m
//  alertView添加block
//
//  Created by 141319 on 15/10/12.
//  Copyright © 2015年 141319. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

const char oldDelegateKey;
const char completionHandlerKey;

@implementation UIAlertView (Block)

- (void)showWithCompletionHandler:(void (^)(NSUInteger))completionHandler
{
    if (completionHandler) {
        //保存alertview的原来的代理
        objc_setAssociatedObject(self, &oldDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        
        //completionHandler 添加成为alertView的一个属性
        objc_setAssociatedObject(self, &completionHandlerKey, completionHandler, OBJC_ASSOCIATION_COPY);
    }
    
    //alertview 的代理设置为本身，就可以自动调用下面的代理方法了
    self.delegate = self;
    [self show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    //根据key，获取completionHandler
    void (^theCompletionHandler)(NSInteger buttonIndex) = objc_getAssociatedObject(self, &completionHandlerKey);

    if(theCompletionHandler == nil)
        return;
    //执行completionHandler
    theCompletionHandler(buttonIndex);
    
    //清空 completionHandlerKey 对应的属性
    objc_setAssociatedObject(self, &completionHandlerKey, nil, OBJC_ASSOCIATION_COPY);
    
    //获取到alertView原先的代理
    id oldDelegate = objc_getAssociatedObject(self, &oldDelegateKey);
    
    //还原代理（oldDelegate ---->self ---->oldDelegate）
    self.delegate = oldDelegate;
    
    //清空 completionHandlerKey 对应的属性
    objc_setAssociatedObject(self, &oldDelegateKey, nil, OBJC_ASSOCIATION_ASSIGN);
}


@end
