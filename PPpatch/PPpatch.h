//
//  Felix.h
//  PPpatch
//
//  Created by 俊城陈 on 2018/5/13.
//  Copyright © 2018年 lvche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPpatch: NSObject
+ (void)fixIt;
+ (void)evalString:(NSString *)javascriptString;
@end
