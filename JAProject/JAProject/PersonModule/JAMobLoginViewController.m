//
//  JAMobLoginViewController.m
//  JAProject
//
//  Created by xiazhongchong on 2018/5/10.
//  Copyright © 2018 esunny. All rights reserved.
//

#import "JAMobLoginViewController.h"
#import "MobManager.h"
@interface JAMobLoginViewController ()

@end

@implementation JAMobLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(100, 100 + 50 * i, 100, 35);
        [button setTitle:[self titles][i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.tag = 200 + i;
    }
}

- (void)clickButton:(UIButton *)btn {
    NSInteger tag = btn.tag - 200;
    if (tag == 0) {
        [MobManager loginUserInfo:SDKPlatFormTypeQQ];
    } else if (tag == 1) {
        [MobManager loginUserInfo:SDKPlatFormTypeWeChat];
    } else {
        [MobManager loginUserInfo:SDKPlatFormTypeWeibo];
    }
}

- (NSArray *)titles {
    return @[@"QQ", @"Wechat", @"Weibo"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
