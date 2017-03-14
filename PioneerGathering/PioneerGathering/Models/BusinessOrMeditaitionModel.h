//
//  BusinessModel.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/9.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface BusinessOrMeditaitionModel : JSONModel

@property (nonatomic, copy)NSString<Optional> *businessId;

@property (nonatomic, copy)NSString<Optional> *title;

@property (nonatomic, copy)NSString<Optional> *imageUrl;

@property (nonatomic, copy)NSString<Optional> *name;

@property (nonatomic, copy)NSString<Optional> *duty;

@property (nonatomic, copy)NSString<Optional> *price;

@property (nonatomic, copy)NSString<Optional> *date;

@property (nonatomic, copy)NSString<Optional> *personsCount;

@property (nonatomic, copy)NSString<Optional> *position;

@end
