//
//  NSFileManager+PPCategory.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (PPCategory)
-(NSString *)cacheDirectoryPath;
-(NSString *)documentsDirectoryPath;

- (void)createDirectoryIfNeeded:(NSString *)dirPath;
@end
