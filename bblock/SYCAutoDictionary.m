//
//  SYCAutoDictionary.m
//  bblock
//
//  Created by 唐余威 on 2018/3/15.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import "SYCAutoDictionary.h"
#import <objc/runtime.h>
@interface SYCAutoDictionary ()
@property (nonatomic,strong)NSMutableDictionary *backingStore;
@end
@implementation SYCAutoDictionary
@dynamic string,number,date,opObject;
//dynamic了系统就不会自动声明上述变量的实例变量及set get方法了
-(instancetype)init {
    if (self = [super init]) {
        _backingStore = [NSMutableDictionary new];
    }
    return self;
}

//resolveInstanceMethod
//+(BOOL)resolveInstanceMethod:(SEL)sel {
//    NSString *selectorStr = NSStringFromSelector(sel);
//    if ([selectorStr hasPrefix:@"set"]) {
//        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
//    }else{
//        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
//    }
//    return YES;
//}




@end
