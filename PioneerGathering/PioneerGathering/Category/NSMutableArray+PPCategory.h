//
//  NSMutableArray+PPCategory.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (PPCategory)
/*
 * Adding and removing entries
 */
- (id)addObjectIfNotNil:(id)object;
- (id)addNonEqualObjectIfNotNil:(id)object;
- (id)addNonIdenticalObjectIfNotNil:(id)object;
- (id)insertObject:(id)object atIndexIfNotNil:(NSUInteger)index;
- (id)moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex;
- (void)removeFirstObject;

/*
 * Ordering and filtering
 */
- (void)shuffle;
- (void)reverse;
- (void)unique;

/*
 * Stack
 */
- (id)push:(id)object;
- (id)pop;

/*
 * Queue
 */
- (id)enqueue:(id)object;
- (id)dequeue;

@end
