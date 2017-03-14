//
//  NSArray+PPCategory.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (PPCategory)
/*
 * Querying
 */
- (id)objectOrNilAtIndex:(NSUInteger)i;
- (id)firstObject;
- (id)randomObject;

/*
 * Ordering and filtering
 */
- (NSArray *)shuffledArray;
- (NSArray *)reversedArray;
- (NSArray *)uniqueArray;

@end
