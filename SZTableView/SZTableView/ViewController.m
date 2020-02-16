//
//  ViewController.m
//  SZTableView
//
//  Created by Manguo on 2020/2/14.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import "ViewController.h"

static NSString *cellId = @"cellId";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datas = @[@"1" , @"2", @"3", @"4", @"5",
                   @"16" , @"7", @"8", @"9", @"10",
                   @"1" , @"2", @"3", @"4", @"5",
                   @"1" , @"2", @"3", @"4", @"5",
                   @"1" , @"2", @"3", @"4", @"5",];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
}




- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.text = [NSString stringWithFormat:@"cellForRowAtIndexPath, index = %ld.", indexPath.row];
    for (NSInteger i = 0; i < 10000; i++) {
//        [cell.contentView addSubview:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)]];
    }
    
    NSLog(@"cellForRowAtIndexPath, index = %ld. celld address = %@", indexPath.row, cell);
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"willDisplayCell, index = %ld. celld address = %@", indexPath.row, cell);
}

@end
