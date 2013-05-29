//
//  ViewController.m
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 20..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DB = [[DBconnect alloc]init];
    [DB openDB];
    [DB createTable:@"test" imgPath:@"imgPath" textField:@"textField" Idx:@"index"];
    DBin = [DB dbQuerySelect];
    maxRecord=[DB totalRecord];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newClick:(id)sender
{
    EditView * editViewController;
    editViewController = [[EditView alloc] initWithNibName:@"EditView" bundle:nil];
    [DB deleteDBall];
    [editViewController initDB:DB array:DBin];
    editViewController.loadData = NO;
    [self presentViewController:editViewController animated:NO completion:^{}];
    
}
- (IBAction)loadClick:(id)sender
{
    EditView * editViewController;
    editViewController = [[EditView alloc] initWithNibName:@"EditView" bundle:nil];
    //db불러오기
    DBin = [DB dbQuerySelect];
    maxRecord=[DB totalRecord];
    
    [editViewController totalIndexinit:maxRecord];
    [editViewController initDB:DB array:DBin];
    editViewController.loadData = YES;
    [self presentViewController:editViewController animated:NO completion:^{}];
}
- (IBAction)forChildPage:(id)sender {
    ChildViewController *childViewController;
    childViewController =[[ChildViewController alloc]initWithNibName:@"ChildViewController" bundle:nil];
    childViewController.modalTransitionStyle = UIModalPresentationFullScreen;
    
    DBin = [DB dbQuerySelect];
    maxRecord=[DB totalRecord];
    
    [childViewController totalIndexinit:maxRecord];
    [childViewController initDB:DB array:DBin];
    childViewController.loadData = YES;
    
    
    [self presentViewController:childViewController animated:YES completion:nil];
}

@end
