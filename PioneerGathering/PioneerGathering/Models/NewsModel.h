//
//  NewsModel.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/10.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface NewsModel : JSONModel

@property (nonatomic, copy)NSString<Optional> *newsId;

@property (nonatomic, copy)NSString<Optional> *title;

@property (nonatomic, copy)NSArray<Optional> *imagesUrl;

@property (nonatomic, copy)NSString<Optional> *time;

@property (nonatomic, copy)NSString<Optional> *comment;

@end
