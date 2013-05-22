//
//  EditView.m
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 20..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import "EditView.h"

@implementation EditView
@synthesize scrollViewPointer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    scrollViewPointer =[[UIScrollView alloc] initWithFrame:CGRectMake(0.0f,0.0f,768.0f,1004.0f)];
    [self.view insertSubview:scrollViewPointer atIndex:0];
    
    numIndex = 0;
    input = [[InputBox alloc]init];
    [input initCoordinate:numIndex x:30 y:50 scroll:scrollViewPointer DBinit:DBinEV];
    [input createBox];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initDB:(DBconnect*)path
{
    DBinEV=path;
}
- (IBAction)addClick:(id)sender {
    [input addLast];
}
-(IBAction)saveDB:(id)sender
{
    [input printlog];
    //[input saveDB:]];
}

@end
