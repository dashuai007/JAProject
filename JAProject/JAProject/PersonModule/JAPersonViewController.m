//
//  JAPersonViewController.m
//  JAProject
//
//  Created by xiazhongchong on 23/03/2018.
//  Copyright © 2018 esunny. All rights reserved.
//

#import "JAPersonViewController.h"
#import "JAFontViewController.h"
#import "JACoreMotionViewController.h"
#import "JAMobLoginViewController.h"

@interface JAPersonViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation JAPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"Person";
    
    [self tableView];
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"simpleCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak typeof(self) weakSelf = self;
    switch (indexPath.row) {
        case 0: {
            JAFontViewController *vc = [[JAFontViewController alloc] init];
            vc.fontBlock = ^{
                [weakSelf.tableView reloadData];
            };
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1: {
            JACoreMotionViewController *vc = [[JACoreMotionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2: {
            JAMobLoginViewController *vc = [[JAMobLoginViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"simpleCell"];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"选择字体";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"运动";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"三方登录";
    }
    cell.textLabel.font = kFont;
    return cell;
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
