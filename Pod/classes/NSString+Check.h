//
//  NSString+Check.h
//  hybridAuth
//
//  Created by yangdd on 2017/3/13.
//  Copyright © 2017年 yangdd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)

+ (BOOL) isNotEmpty:(NSString *) str;

+ (BOOL) isEmpty:(NSString *) str;

@end
