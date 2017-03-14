//
//  MyKnowledgeStoreCell.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/11.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "BaseTableViewCell.h"

#import "KnowledgeStoreModel.h"

@interface MyKnowledgeStoreCell : BaseTableViewCell

@property (nonatomic, strong) KnowledgeStoreModel *model;
@property (nonatomic, copy) void (^deleteKnowledge)(KnowledgeStoreModel *model);

@end
