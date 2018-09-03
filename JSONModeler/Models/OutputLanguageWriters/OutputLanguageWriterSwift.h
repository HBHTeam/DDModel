//
//  OutputLanguageWriterSwift.h
//  JSON Accelerator
//
//  Created by hbh112 on 2018/9/3.
//  Copyright © 2018年 Nerdery Interactive Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OutputLanguageWriterProtocol.h"

static NSString * const kSwiftWritingOptionBaseClassName = @"kSwiftWritingOptionBaseClassName";
static NSString * const kSwiftWritingOptionUseARC = @"kSwiftWritingOptionUseARC";
static NSString * const kSwiftWritingOptionClassPrefix = @"kSwiftWritingOptionClassPrefix";

@interface OutputLanguageWriterSwift : NSObject <OutputLanguageWriterProtocol>

@end
