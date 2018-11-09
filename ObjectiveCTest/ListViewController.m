//
//  ListViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/8.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ListViewController.h"
#import "OrderViewController.h"

@interface ListViewController ()

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray *array;
@property (nonatomic) UIBarButtonItem *dismissBtn;

-(void) dismissThisView;

@end

@implementation ListViewController

@synthesize tableView, array;

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        array = [[NSArray alloc] init];
    }
    return self;
}

- (void)loadView{
    UIView *mainView = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    mainView.backgroundColor = [UIColor whiteColor];
    mainView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    array = [NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    tableView.rowHeight = 60;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderViewController *orderVC = [[OrderViewController alloc] init];
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:orderVC];
    [self presentViewController:naviVC animated:true completion:nil];
}

-(void)dismissThisView{
    [self dismissViewControllerAnimated:true completion:nil];
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
