//
//  PushedTwoViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/12.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "PushedTwoViewController.h"
#import "SearchResultViewController.h"

@interface PushedTwoViewController ()

@property (nonatomic) SearchResultViewController *searchResultController;

@property (nonatomic) UISearchController *searchController;

@property (nonatomic) NSMutableArray *array;

@end

@implementation PushedTwoViewController

@synthesize searchResultController, searchController, array;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    array = [[NSMutableArray alloc] init];
    
    for (int i=0; i<100; i++) {
        @autoreleasepool {
             [array addObject: [NSString stringWithFormat:@"%d", i]];
        }
    }
    
    searchResultController = [[SearchResultViewController alloc] init];
    searchResultController.dataArray = [[NSMutableArray alloc] init];
    
    searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultController];
    searchController.delegate = self;
    searchController.searchResultsUpdater = self;
    self.definesPresentationContext = YES;
    searchController.searchBar.frame = CGRectMake(0, 0, 250, 35);
    searchController.searchBar.placeholder = @"搜索数字";
    
    if (@available(iOS 11.0, *)) {
        self.navigationItem.searchController = searchController;
        self.navigationItem.hidesSearchBarWhenScrolling = NO;
    }
    else{
        self.navigationItem.titleView = searchController.searchBar;
    }
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *text = searchController.searchBar.text;
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *strObj = obj;
        if ([strObj containsString:text]) {
            [dataArray addObject:strObj];
        }
    }];
    
    searchResultController.dataArray = dataArray;
    [searchResultController.tableView reloadData];
}

@end
