//
//  JAFontViewController.h
//  JAProject
//
//  Created by xiazhongchong on 2018/4/17.
//  Copyright © 2018 esunny. All rights reserved.
//

#import "JABaseViewController.h"

typedef void(^NewFontSettingBlock)(void);

@interface JAFontViewController : JABaseViewController

@property (nonatomic, copy) NewFontSettingBlock fontBlock;

@end
