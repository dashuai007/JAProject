//
//  MobManager.h
//  JAProject
//
//  Created by xiazhongchong on 2018/5/10.
//  Copyright © 2018 esunny. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SDKPlatFormType) {
    SDKPlatFormTypeQQ,
    SDKPlatFormTypeWeibo,
    SDKPlatFormTypeWeChat,
};

@interface MobManager : NSObject

+ (void)registerActivePlatforms;

+ (void)loginUserInfo:(SDKPlatFormType)platType;
@end
