//
//  CYLHttpRequest.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "CYLHttpRequest.h"

@implementation CYLHttpRequest

+ (void)post:(NSString *)url params:(NSDictionary *)params onComplete:(void (^)(NSDictionary *json, BOOL isSuccess))onComplete {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;

    
    url = [NSString stringWithFormat:@"%@%@", [DataManager sharedManager].hostURL, url];
    NSLog(@"请求数据的接口url is %@",url);
    
    /// 加载菊花
    [appdel showLoadingMessage];
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //网络请求成功
        NSData *resData = [[NSData alloc] initWithData:responseObject];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"resultDic==%@",resultDic);
        if (onComplete) {
            
            /// 取消菊花
            [appdel hideLoadingMessage];
            
            if (![resultDic[@"code"] boolValue]) {
                onComplete(resultDic,NO);
                [appdel showHudwithTitle:@"温馨提示" detail:resultDic[@"message"]];
            }else {
//                NSDictionary *dataDict = resultDic;
//                for (NSDictionary *dic in dataDict[@"data"]) {
//                    for (NSTaggedPointerString *myString in [dic allValues]) {
//                        
//                    }
//                    NSString* dataString = [NSString stringWithString:<# myNSTaggegedString #>];
//                }
                onComplete(resultDic,YES);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (onComplete) {
            /// 取消菊花
            [appdel hideLoadingMessage];
            [appdel showHudwithTitle:@"温馨提示" detail:error.localizedDescription];
            onComplete(nil,NO);
        }
    }];
}


+ (void)post:(NSString *)url params:(NSDictionary *)params imageData:(NSData *)imageData imageName:(NSString *)imageName onComplete:(void (^)(NSDictionary *, BOOL))onComplete {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    

//    if ([DataManager sharedManager].isLogin) {
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSMutableDictionary *dic = [params mutableCopy];
//            [dic setObject:[DataManager sharedManager].userInfo.uid forKey:@"uid"];
//            params = [dic copy];
//        }else {
//            params = @{@"uid" : [DataManager sharedManager].userInfo.uid};
//        }
//    }
    
    url = [NSString stringWithFormat:@"%@%@", [DataManager sharedManager].hostURL, url];
    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:imageData name:imageName fileName:[NSString stringWithFormat:@"%@.png", imageName] mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //网络请求成功
        NSData *resData = [[NSData alloc] initWithData:responseObject];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        
        if (onComplete) {
            if ([resultDic[@"Result"] boolValue]) {
                [appdel showHudwithTitle:@"温馨提示" detail:resultDic[@"Message"]];
            }else {
                onComplete(resultDic,YES);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"错误 %@", error.localizedDescription);
        [appdel showHudwithTitle:@"温馨提示" detail:error.localizedDescription];
        
    }];
}



+ (void)get:(NSString *)url params:(NSDictionary *)params onComplete:(void (^)(NSDictionary *json, BOOL isSuccess))onComplete {
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20;
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    
//    if ([DataManager sharedManager].isLogin) {
//        if ([params isKindOfClass:[NSDictionary class]]) {
//            NSMutableDictionary *dic = [params mutableCopy];
//            [dic setObject:[DataManager sharedManager].userInfo.uid forKey:@"uid"];
//            params = [dic copy];
//        }else {
//            params = @{@"uid" : [DataManager sharedManager].userInfo.uid};
//        }
//    }
    
    url = [NSString stringWithFormat:@"%@%@", [DataManager sharedManager].hostURL, url];
    
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //网络请求成功
        NSData *resData = [[NSData alloc] initWithData:responseObject];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        
        if (onComplete) {
            if ([resultDic[@"Result"] boolValue]) {
                [appdel showHudwithTitle:@"温馨提示" detail:resultDic[@"Message"]];
                onComplete(resultDic,YES);
            }else {
                onComplete(resultDic,YES);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (onComplete) {
            [appdel showHudwithTitle:@"温馨提示" detail:error.localizedDescription];
            onComplete(nil,NO);
        }
        
    }];
}
@end
