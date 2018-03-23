//
//  JABaseTableView.m
//  JAProject
//
//  Created by xiazhongchong on 23/03/2018.
//  Copyright © 2018 esunny. All rights reserved.
//

#import "JABaseTableView.h"

@interface JABaseTableView() <UITableViewDelegate, UITableViewDataSource>

@end

@implementation JABaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        
        
    }
    return self;
}










/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
