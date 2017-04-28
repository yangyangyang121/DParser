//
//  NSString+Check.m
//  hybridAuth
//
//  Created by yangdd on 2017/3/13.
//  Copyright © 2017年 yangdd. All rights reserved.
//

#import "NSString+Check.h"

@implementation NSString (Check)

+ (BOOL) isNotEmpty:(NSString *) str {

    if (str == nil) {
        return NO;
    }

    NSString *trimmedString = [str stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];

    if ([trimmedString isEqualToString:@""]) {
        return NO;
    }

    return YES;
}

+ (BOOL) isEmpty:(NSString *) str {

    if ([self isNotEmpty:str]) {
        return NO;
    }

    return YES;
}

@end
