//
//  DataManager.m
//  ZhongYiEld
//
//  Created by reneboy on 16/4/12.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

-(id) init{
    self = [super init];
    
    if (self){
//        _maxDownloadOperationCount = 5;
        _host = @"zyapi.rocoinfo.com/";
        _hostURL = [NSString stringWithFormat:@"http://%@",_host];
        _userInfo = [[UserInfoModel alloc]init];
    }
    return self;
}

- (void)getUserMessage: (NSDictionary *)userDic {
    NSError *error = nil;
    self.userInfo = [[UserInfoModel alloc]initWithDictionary:userDic error:&error];
    self.userInfo.userid = userDic[@"id"];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:_userInfo.userid forKey:@"id"];
    [userDefaults setObject:_userInfo.name forKey:@"name"];
    [userDefaults setObject:_userInfo.gender forKey:@"gender"];
    [userDefaults setObject:_userInfo.idCard forKey:@"idCard"];
    [userDefaults setObject:_userInfo.birthday forKey:@"birthday"];
    [userDefaults setObject:_userInfo.mobile forKey:@"mobile"];
    [userDefaults setObject:_userInfo.imgUrl forKey:@"imgUrl"];
    
//    [userDefaults setObject:_userInfo.mobile forKey:@"mobile"];
//    [userDefaults setObject:_userInfo.password forKey:@"password"];
    
    [userDefaults setObject:userDic forKey:@"userInfo"];

    [userDefaults synchronize];
}

- (void)changeUserAvatar:(NSString *)photoName {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    self.userInfo.userid = [ud objectForKey:@"id"];
    self.userInfo.name = [ud objectForKey:@"name"];
    self.userInfo.gender = [ud objectForKey:@"gender"];
    self.userInfo.idCard = [ud objectForKey:@"idCard"];
    self.userInfo.birthday = [ud objectForKey:@"birthday"];
    self.userInfo.mobile = [ud objectForKey:@"mobile"];
    self.userInfo.imgUrl = [ud objectForKey:@"imgUrl"];
    
    NSDictionary *dict = @{@"id" : self.userInfo.userid,
                           @"name" : self.userInfo.name,
                           @"gender" : self.userInfo.gender,
                           @"idCard" : self.userInfo.idCard,
                           @"birthday" : self.userInfo.birthday,
                           @"mobile" : self.userInfo.mobile,
                           @"imgUrl" : self.userInfo.imgUrl};
    [ud setObject:dict forKey:@"userInfo"];
}

- (UserInfoModel *)getUserInfo {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [ud objectForKey:@"userInfo"];
    UserInfoModel *model = [[UserInfoModel alloc] initWithDictionary:dict error:nil];
    
    return model;
}

- (void)clearUserMessage {
    
    _userInfo.userid = nil;
    _userInfo.name = nil;

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"id"];
    [userDefaults removeObjectForKey:@"name"];
    [userDefaults removeObjectForKey:@"gender"];
    [userDefaults removeObjectForKey:@"idCard"];
    [userDefaults removeObjectForKey:@"birthday"];
    [userDefaults removeObjectForKey:@"mobile"];
    [userDefaults removeObjectForKey:@"imgUrl"];
//    [userDefaults removeObjectForKey:@"mobile"];
//    [userDefaults removeObjectForKey:@"password"];
    [userDefaults synchronize];

    //删除所有userdefult
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
}

- (void)getUserMessageFromUserDefaults {

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.userInfo.userid = [userDefaults objectForKey:@"id"];
    self.userInfo.name = [userDefaults objectForKey:@"name"];
    self.userInfo.gender = [userDefaults objectForKey:@"gender"];
    self.userInfo.idCard = [userDefaults objectForKey:@"idCard"];
    self.userInfo.birthday = [userDefaults objectForKey:@"birthday"];
    self.userInfo.mobile = [userDefaults objectForKey:@"mobile"];
    self.userInfo.imgUrl = [userDefaults objectForKey:@"imgUrl"];
    
//    self.userInfo.mobile = [userDefaults objectForKey:@"mobile"];
//    self.userInfo.password = [userDefaults objectForKey:@"password"];
}

- (NSURL *)appendHTMLURL:(NSURL *)url {
    
    NSString *urlString = url.absoluteString;
    
    if([urlString rangeOfString:@"?"].location !=NSNotFound) {
        
        urlString = [NSString stringWithFormat:@"%@&type=ios", urlString];
        
    }else {
        
        urlString = [NSString stringWithFormat:@"%@?type=ios", urlString];
        
    }
    
    return [NSURL URLWithString:urlString];
}

- (BOOL)isLogin {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (_userInfo.userid) {
        [ud setBool:YES forKey:@"hadLogedIn"];
        return YES;
    }else{
        [ud setBool:NO forKey:@"hadLogedIn"];
        return NO;
    }
}

- (BOOL)hadLogedIn {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud boolForKey:@"hadLogedIn"];
}

- (void)recordLoginState:(BOOL)loginState {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:loginState forKey:@"hadLogedIn"];
}

//////////////////////////////////////////////////////////////////////////

static DataManager *sharedDataManager = nil;

+ (DataManager *) sharedManager
{
    @synchronized(self)
    {
        if (sharedDataManager == nil)
        {
            return [[self alloc] init];
        }
    }
    
    return sharedDataManager;
}

+(id)alloc
{
    @synchronized(self)
    {
        NSAssert(sharedDataManager == nil, @"Attempted to allocate a second instance of a singleton.");
        sharedDataManager = [super alloc];
        return sharedDataManager;
    }
    return nil;
}



@end
