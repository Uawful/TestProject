//
//  MyNetWorkFetcher.h
//  bblock
//
//  Created by 唐余威 on 2018/4/17.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^MyNetWorkFetcherCompletionHandler)(NSData *data);
@interface MyNetWorkFetcher : NSObject

- (id)initWithURL:(NSURL *)URL;
- (void)startWithCompletionHandler:(MyNetWorkFetcherCompletionHandler)handler;

@end
