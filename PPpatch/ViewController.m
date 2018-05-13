//
//  ViewController.m
//  PPpatch
//
//  Created by 俊城陈 on 2018/5/13.
//  Copyright © 2018年 lvche. All rights reserved.
//

#import "ViewController.h"
#import "MightyCrash.h"

#import "PPpatch.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    

    
    
    
    [PPpatch fixIt];

    NSString *fixScriptString = @" \
    fixInstanceMethodReplace('MightyCrash', 'divideUsingDenominator:', function(instance, originInvocation, originArguments){ \
    if (originArguments[0] == 0) { \
    console.log('zero goes here'); \
    } else { \
    runInvocation(originInvocation); \
    } \
    }); \
    \
    ";

    [PPpatch evalString:fixScriptString];
    
    
    MightyCrash *mc = [[MightyCrash alloc] init];
    float result = [mc divideUsingDenominator:3];
    NSLog(@"result: %.3f", result);
    result = [mc divideUsingDenominator:0];
    NSLog(@"won't crash for resutl %f",result);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
