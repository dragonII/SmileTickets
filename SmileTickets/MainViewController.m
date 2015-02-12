//
//  ViewController.m
//  SmileTickets
//
//  Created by Wang Long on 2/6/15.
//  Copyright (c) 2015 Wang Long. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) UIImageView *backgroundImageView;

@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;
@property (strong, nonatomic) UIButton *button4;
@property (strong, nonatomic) UIButton *button5;

@property (strong, nonatomic) NSArray *buttonArray;

@property DetailType selectedDetailType;

@end

@implementation MainViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if(self.selectedDetailType != detailTypeAbout)
    {
        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        detailVC.detailType = self.selectedDetailType;
    }
}

- (void)buttonClicked:(UIButton *)sender
{
    NSLog(@"%d", sender.tag);
    self.selectedDetailType = sender.tag;
    if(self.selectedDetailType != detailTypeAbout)
        [self performSegueWithIdentifier:@"ShowDetailSegue" sender:self];
    else
        [self performSegueWithIdentifier:@"ShowAboutSegue" sender:self];
}

- (void)initViews
{
    CGFloat buttonWidth = 84.0f;
    CGFloat buttonHeight = 84.0f;
    CGFloat x = 14.0f;
    CGFloat y = 280.0f;
    
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    self.backgroundImageView.image = [UIImage imageNamed:@"BasicBackground"];
    [self.view addSubview:self.backgroundImageView];
    
    self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(x, y, buttonWidth, buttonHeight)];
    self.button2 = [[UIButton alloc] initWithFrame:CGRectMake(x + 100, y, buttonWidth, buttonHeight)];
    self.button3 = [[UIButton alloc] initWithFrame:CGRectMake(x + 200, y, buttonWidth, buttonHeight)];
    self.button4 = [[UIButton alloc] initWithFrame:CGRectMake(x, y + 95, buttonWidth, buttonHeight)];
    self.button5 = [[UIButton alloc] initWithFrame:CGRectMake(x + 100, y + 95, buttonWidth, buttonHeight)];
    
    [self putButtonsIntoArray];
    
    for(int i = 0; i < [self.buttonArray count]; i++)
    {
        UIButton *button = (UIButton *)[self.buttonArray objectAtIndex:i];
        button.tag = i;
        //button.backgroundColor = [UIColor grayColor];
        //button.alpha = 0.5f;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
}

- (void)putButtonsIntoArray
{
    self.buttonArray = @[self.button1,
                         self.button2,
                         self.button3,
                         self.button4,
                         self.button5];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    
    [self initViews];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
