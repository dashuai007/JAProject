//
//  JAFontViewController.m
//  JAProject
//
//  Created by xiazhongchong on 2018/4/17.
//  Copyright © 2018 esunny. All rights reserved.
//

#import "JAFontViewController.h"

@interface JAFontViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray <NSString *>*fontFamilies;
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation JAFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    fontFamilies = [NSMutableArray array];
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    //当前字体
    
    NSArray *familyNames = [UIFont familyNames];
    for (id family in familyNames) {
        NSArray* fonts = [UIFont fontNamesForFamilyName:family];
        for (id font in fonts)
        {
            [fontFamilies addObject:font];
        }
    }
    [self.tableView reloadData];
    
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"simpleCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[NSUserDefaults standardUserDefaults] setObject:fontFamilies[indexPath.row] forKey:kSelectedFontStr];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (self.fontBlock) {
        self.fontBlock();
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return fontFamilies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"simpleCell"];
    }
    cell.textLabel.text = fontFamilies[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:fontFamilies[indexPath.row] size:[UIFont systemFontSize]];
                                 
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
