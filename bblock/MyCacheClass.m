//
//  MyCacheClass.m
//  bblock
//
//  Created by 唐余威 on 2018/4/17.
//  Copyright © 2018年 yyz. All rights reserved.
//

#import "MyCacheClass.h"
#import "MyNetWorkFetcher.h"
@implementation MyCacheClass
{
    NSCache *_cache;
}
-(instancetype)init {
    if (self = [super init]) {
        _cache = [NSCache new];
        _cache.totalCostLimit = 5 * 1024 * 1024;
        _cache.countLimit = 100;
    }
    return self;
}

//- (void)downLoadDataWithURL:(NSURL *)url {
//    NSData *cacheData = [_cache objectForKey:url];
//    if (cacheData) {
////        [self useData:cacheData];
//    }else{
//        //下载
//        MyNetWorkFetcher *fetcher = [[MyNetWorkFetcher alloc]initWithURL:url];
//        [fetcher startWithCompletionHandler:^(NSData *data) {
//            [_cache setObject:data forKey:url cost:data.length];
////            [self useData:cacheData];
//        }];
//    }
//}

//寸的类型用NSPurgeableData(可丢弃的类，系统按自愿状况判断)代替
- (void)downLoadDataWithURL:(NSURL *)url {
    NSPurgeableData *purgeableData = [_cache objectForKey:url];
    if (purgeableData) {
        //stop the data being purged
        [purgeableData beginContentAccess];
//        [self useData:purgeableData];
        //make that data can be purged again
        [purgeableData endContentAccess];
    }else{
        MyNetWorkFetcher *fetcher = [[MyNetWorkFetcher alloc]initWithURL:url];
        [fetcher startWithCompletionHandler:^(NSData *data) {
            NSPurgeableData *purgeableData = [NSPurgeableData dataWithData:data];
            [_cache setObject:purgeableData forKey:url cost:purgeableData.length];
            //刚创建出来不用startContentAccess 相当于引用计数alloc就+1了；
//            [self useData:purgeableData];
            
            [purgeableData endContentAccess];
            
        }];
    }
    
}

@end
