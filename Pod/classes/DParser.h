//
//  DParser.h
//  DParser
//
//  Created by yangdd on 2017/4/28.
//  Copyright © 2017年 yangdd. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for DParser.
FOUNDATION_EXPORT double DParserVersionNumber;

//! Project version string for DParser.
FOUNDATION_EXPORT const unsigned char DParserVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <DParser/PublicHeader.h>

#import <Foundation/Foundation.h>

@interface DParser : NSObject

+ (id) parser:(NSDictionary *)dictionary class:(Class)class;

@end

