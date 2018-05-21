//
//  MobManager.m
//  JAProject
//
//  Created by xiazhongchong on 2018/5/10.
//  Copyright © 2018 esunny. All rights reserved.
//

#import "MobManager.h"

#import <ShareSDKConnector/ShareSDKConnector.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <ShareSDK/ShareSDK.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "WeiboSDK.h"

#define AppKey @"25b1ba7399589"
#define AppSecret @"6ba66378db8f97e0f4763c02a203ba4f"

@implementation MobManager

+ (void)registerActivePlatforms {
    [ShareSDK registerActivePlatforms:@[ @(SSDKPlatformTypeSinaWeibo), @(SSDKPlatformTypeWechat), @(SSDKPlatformTypeQQ),] onImport:^(SSDKPlatformType platformType) {
        switch (platformType)
        {
            case SSDKPlatformTypeWechat:
                [ShareSDKConnector connectWeChat:[WXApi class]];
                break;
            case SSDKPlatformTypeQQ:
                [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                break;
            case SSDKPlatformTypeSinaWeibo:
                [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                break;
            default:
                break;
        }
    } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
        switch (platformType)
        {
            case SSDKPlatformTypeSinaWeibo:
                //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                                          appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                        redirectUri:@"http://www.sharesdk.cn"
                                           authType:SSDKAuthTypeBoth];
                break;
            case SSDKPlatformTypeWechat:
                [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                      appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                break;
            case SSDKPlatformTypeQQ:
                [appInfo SSDKSetupQQByAppId:@"100371282"
                                     appKey:@"aed9b0303e3ed1e27bae87c33761161d"
                                   authType:SSDKAuthTypeBoth];
                break;
            
            
            default:
                break;
        }
    }];
}

+ (void)loginUserInfo:(SDKPlatFormType)platType {
    SSDKPlatformType loginType;
    if (platType == SDKPlatFormTypeQQ) {
        loginType = SSDKPlatformSubTypeQQFriend;
    } else if (platType == SDKPlatFormTypeWeibo) {
        loginType = SSDKPlatformTypeSinaWeibo;
    } else {
        loginType = SSDKPlatformSubTypeWechatSession;
    }
    
    [ShareSDK getUserInfo:loginType onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess) {
            NSLog(@"name:%@ url:%@, uid:%@", user.nickname, user.url, user.uid);
        } else {
            NSLog(@"third login fail");
        }
    }];
}

@end
