//
//  KnowledgeStoreModel.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/10.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface KnowledgeStoreModel : JSONModel

@property (nonatomic, copy)NSString<Optional> *knowledgeId;

@property (nonatomic, copy)NSString<Optional> *title;

@property (nonatomic, copy)NSString<Optional> *imageUrl;

@property (nonatomic, copy)NSString<Optional> *time;

@property (nonatomic, copy)NSString<Optional> *comment;

@property (nonatomic, copy)NSString<Optional> *collection;

@end
