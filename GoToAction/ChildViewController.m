//
//  ChildViewController.m
//  GoToAction
//
//  Created by JungGang on 13. 5. 25..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController
@synthesize textBox;
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

    //inputList = [[NSMutableArray alloc]init];
    childView = [[UIImageView alloc]init];
    [self.view addSubview:childView];
    [self ViewResize];
    numIndex = 0;
    childView.image = [[UIImage alloc] initWithContentsOfFile:DBarray[numIndex][0]];
    [childView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [childView.layer setBorderWidth:1.0];
    //titleBox.text=DBarray[numIndex][0];
    textBox.text=DBarray[numIndex][1];

    
}
-(void) totalIndexinit:(int)num
{
    totalIdx = num-1;
}
-(void) initDB:(DBconnect*)path array:(NSMutableArray*)array
{
    DBinEV = path;
    DBarray = array;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    if(numIndex==0){
        childView.image = [[UIImage alloc] initWithContentsOfFile:DBarray[numIndex][0]];
        //titleBox.text=DBarray[numIndex][0];
        textBox.text=DBarray[numIndex][1];
    }
    else{
        numIndex--;
        childView.image = [[UIImage alloc] initWithContentsOfFile:DBarray[numIndex][0]];
        //titleBox.text=DBarray[numIndex][0];
        textBox.text=DBarray[numIndex][1];

    }	
}

- (IBAction)nextButton:(id)sender {
    if(totalIdx>numIndex){
        numIndex++;
        childView.image = [[UIImage alloc] initWithContentsOfFile:DBarray[numIndex][0]];
        textBox.text=DBarray[numIndex][1];
    }
    else{
        if(totalIdx==numIndex){
            numIndex++;
            childView.image = [UIImage imageNamed:@"finish.png"];
            textBox.text=@"참 잘했어요!!\n끝~!";
        }else{
            [self dismissViewControllerAnimated:NO completion:^{}];
        }
    }
    
}

- (IBAction)backBarButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:^{}];
    
}
- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self ViewResize];
}
-(void) ViewResize
{
    RightorLeft =  NO;
    if(self.interfaceOrientation==UIInterfaceOrientationLandscapeLeft||self.interfaceOrientation==UIInterfaceOrientationLandscapeRight)
        RightorLeft = YES;
    
    if(([UIDevice currentDevice].orientation)==UIInterfaceOrientationLandscapeLeft||([UIDevice currentDevice].orientation)==UIInterfaceOrientationLandscapeRight)
        RightorLeft = YES;
    
    if(RightorLeft){
        childView.frame = CGRectMake(307, 100, 400, 400);
        textBox.frame = CGRectMake(257, 520, 500, 240);
    }else{
        childView.frame = CGRectMake(135, 150, 500, 500);
        textBox.frame = CGRectMake(152, 660, 465, 320);
    }
}

@end
