//
//  DetailViewController.m
//  SmileTickets
//
//  Created by Wang Long on 2/6/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewCell.h"
#import "AccountInfoTableViewCell.h"

static NSString *DetailCellIdentifier = @"DetailCell";
static NSString *AccountCellIdentifier = @"AccountCell";

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSArray *accountInfoArray;

@end

@implementation DetailViewController

- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64,
                                                                   self.view.frame.size.width,
                                                                   self.view.frame.size.height - 64)];
    
    if(self.detailType == detailTypeTickets ||
       self.detailType == detailTypeValley ||
       self.detailType == detailTypeOrders)
    {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    UINib *nib = [UINib nibWithNibName:@"DetailTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:DetailCellIdentifier];
    
    nib = [UINib nibWithNibName:@"AccountInfoTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:AccountCellIdentifier];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView = view;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
}

- (void)loadDataArray
{
    self.dataArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < 17; i++)
        [self.dataArray addObject:[NSString stringWithFormat:@"ID: %d", i]];
    
    self.accountInfoArray = @[@"姓",
                              @"名",
                              @"密码",
                              @"Email",
                              @"手机号",
                              @"联系人",
                              @"联系地址",
                              @"邮政编码"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadDataArray];
    
    [self initTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (self.detailType)
    {
        case detailTypeTickets:
        case detailTypeValley:
        case detailTypeOrders:
            return [self.dataArray count];
            
        case detailTypeSettings:
            return [self.accountInfoArray count];
            
        default:
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.detailType)
    {
        case detailTypeTickets:
        case detailTypeValley:
        case detailTypeOrders:
            return 88.0f;
        case detailTypeSettings:
            return 44.0f;
            
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.detailType)
    {
        case detailTypeTickets:
        case detailTypeValley:
        case detailTypeOrders:
        {
            DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailCellIdentifier];
            if(cell == nil)
                cell = [[DetailTableViewCell alloc] init];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        case detailTypeSettings:
        {
            AccountInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AccountCellIdentifier];
            if(cell == nil)
                cell = [[AccountInfoTableViewCell alloc] init];
            cell.cellNameLabel.text = [self.accountInfoArray objectAtIndex:indexPath.row];
            return cell;
        }
            
        default:
            return [[UITableViewCell alloc] init];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
