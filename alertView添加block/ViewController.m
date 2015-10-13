//
//  ViewController.m
//  alertView添加block
//
//  Created by 141319 on 15/10/12.
//  Copyright © 2015年 141319. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+Block.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"alertView" message:@"block替换代理" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert showWithCompletionHandler:^(NSUInteger buttonIndex) {
        if (buttonIndex == 0) {
            NSLog(@"点击了取消？");
        }else{
            NSLog(@"点击了确定");
        }
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
