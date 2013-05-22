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
    [DB createTable:@"abc" imgPath:@"imgPath" textField:@"textField" Idx:@"index"];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editClick:(id)sender{
    EditView * editViewController;
    editViewController = [[EditView alloc] initWithNibName:@"EditView" bundle:nil];
    [self presentViewController:editViewController animated:NO completion:^{}];
    [editViewController initDB:DB];
    
}


@end
