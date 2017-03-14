//
//  AXXValidInput.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "AXXValidInput.h"

@implementation AXXValidInput

#pragma mark - Verify Password

+ (BOOL)isPassword:(NSString *)password
{
    if (!password) return NO;
    
    NSString* regexp = @"\\w{6,20}";
    NSPredicate* predication = [NSPredicate predicateWithFormat:@"self matches %@",regexp];
    
    NSString* sPssword = @"";
    
    if ([password isKindOfClass:[NSString class]]) {
        sPssword = password;
    }else if ([password isKindOfClass:[NSNumber class]]) {
        sPssword = [((NSNumber*)sPssword) stringValue];
    }
    
    if ([predication evaluateWithObject:sPssword]) return YES;
    
    return NO;
}



#pragma mark - Verify Mobile With Specifi Type (0 mobile phone 1 fixed telephone)
+ (BOOL)isMobile:(NSString *)mobile
{
    if (!mobile){
        return NO;
    }
    
    NSString* regexp = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate* predication = [NSPredicate predicateWithFormat:@"self matches %@",regexp];
    
    if ([predication evaluateWithObject:mobile]){
        return YES;
    }
    return NO;
}

#pragma mark --验证码倒计时

+(void)settimer:(UIButton *)timerbtn{
    __block int timeout = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [timerbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                timerbtn.userInteractionEnabled = YES;
            });
        } else {
            NSInteger seconds = timeout % 60 ;
            NSString *strTime = [NSString stringWithFormat:@"%ld", (long)seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [timerbtn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                timerbtn.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

@end
