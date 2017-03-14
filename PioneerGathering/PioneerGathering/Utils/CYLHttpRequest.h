//
//  CYLHttpRequest.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface CYLHttpRequest : NSObject

+(void)post:(NSString *)url
     params:(NSDictionary *)params
 onComplete:(void(^)(NSDictionary* json,BOOL isSuccess)) onComplete;

/// 头像上传
+(void)post:(NSString *)url
     params:(NSDictionary *)params
  imageData:(NSData *)imageData
  imageName:(NSString *)imageName
 onComplete:(void(^)(NSDictionary* json,BOOL isSuccess)) onComplete;

+(void)get:(NSString *)url params:(NSDictionary*)params onComplete:(void(^)(NSDictionary*json,BOOL isSuccess))onComplete;


@end
