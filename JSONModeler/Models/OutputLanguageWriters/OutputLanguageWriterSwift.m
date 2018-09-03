//
//  OutputLanguageWriterSwift.m
//  JSON Accelerator
//
//  Created by hbh112 on 2018/9/3.
//  Copyright © 2018年 Nerdery Interactive Labs. All rights reserved.
//

#import "OutputLanguageWriterSwift.h"
#import "ClassBaseObject.h"

@interface OutputLanguageWriterSwift ()
@property (nonatomic, assign) BOOL buildForARC;

@end
@implementation OutputLanguageWriterSwift

- (BOOL)writeClassObjects:(NSDictionary *)classObjectsDict toURL:(NSURL *)url options:(NSDictionary *)options generatedError:(BOOL *)generatedErrorFlag{
    BOOL filesHaveHadError = NO;
    BOOL filesHaveBeenWritten = NO;

    NSArray *files = classObjectsDict.allValues;
    
    /* Determine whether or not to build for ARC */
    if (nil != options[kSwiftWritingOptionUseARC]) {
        self.buildForARC = [options[kSwiftWritingOptionUseARC] boolValue];
    } else {
        /* Default to not building for ARC */
        self.buildForARC = NO;
    }
    
    for (ClassBaseObject *base in files) {
        NSString *newBaseClassName = base.className;

        if ([base.className isEqualToString:@"InternalBaseClass"]){
            if (nil != options[kSwiftWritingOptionBaseClassName]){
                newBaseClassName = options[kSwiftWritingOptionBaseClassName];

            }else{
                newBaseClassName = @"BaseClass";
            }
            
            BOOL hasUniqueFileNameBeenFound = NO; // 解析出类名
            NSUInteger classCheckInteger = 2;
            
            while (hasUniqueFileNameBeenFound) {
                hasUniqueFileNameBeenFound = YES;
                
                for (ClassBaseObject *collisionBaseObject in files) { // 是基类名 下一步
                    if ([collisionBaseObject.className isEqualToString:newBaseClassName]) {
                        hasUniqueFileNameBeenFound = NO;
                    }
                }
                
                if (hasUniqueFileNameBeenFound == NO) { // 这个代码可能是为了查重吧
                    newBaseClassName = [NSString stringWithFormat:@"%@%li", newBaseClassName, classCheckInteger];
                    classCheckInteger++;
                }
            }
        }
        
        // 把设置的前缀补加上
        if (nil != options[kSwiftWritingOptionClassPrefix]) {
            newBaseClassName = [NSString stringWithFormat:@"%@%@", options[kSwiftWritingOptionClassPrefix], newBaseClassName ];
        }
        
        base.className = newBaseClassName;

    }
    
    for (ClassBaseObject *base in files) {
        <#statements#>
    }
    
}
@end
