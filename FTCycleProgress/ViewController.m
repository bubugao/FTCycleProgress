//
//  ViewController.m
//  FTCycleProgress
//
//  Created by xiaodou on 2016/10/28.
//  Copyright © 2016年 xiaodouxiaodou. All rights reserved.
//

#import "ViewController.h"
#import "FTCycleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self cycleProgressTest];
}

- (void)cycleProgressTest {
    
    FTCycleView *cycleView = [[FTCycleView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:cycleView];
    
    __block NSInteger progress = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        progress = progress + 10;
        if (progress <= 100) {
            [cycleView drawCycleProgress:progress/100.0];
            
        } else {
            [timer invalidate];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
