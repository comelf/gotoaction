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
@synthesize loadData,titleBox,textBox,childView;
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
     inputList = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view from its nib.
    numIndex = 0;
    childView.image = [[UIImage alloc] initWithContentsOfFile:DBarray[numIndex][1]];
    titleBox.text=DBarray[numIndex][1];
    textBox.text=DBarray[numIndex][2];
    
    
}
-(void) totalIndexinit:(int)num
{
    totalIdx = num-1;
    NSLog(@"%d",totalIdx);
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
        childView.image = [[UIImage alloc] initWithContentsOfFile:DBarray[numIndex][1]];
        titleBox.text=DBarray[numIndex][1];
        textBox.text=DBarray[numIndex][2];
    }
    else{
        numIndex--;
        childView.image = [[UIImage alloc] initWithContentsOfFile:DBarray[numIndex][1]];        titleBox.text=DBarray[numIndex][1];
        textBox.text=DBarray[numIndex][2];

    }	
}

- (IBAction)nextButton:(id)sender {
    if(totalIdx>numIndex){
        numIndex++;
        childView.image = [[UIImage alloc] initWithContentsOfFile:DBarray[numIndex][1]];
        //titleBox.text=DBarray[numIndex][1];
        textBox.text=DBarray[numIndex][2];
        
    }
    else{
        if(totalIdx==numIndex){
            numIndex++;
            childView.image=nil;
            titleBox.text=@"";
            textBox.text=@"끝!!";
        }else{
            [self dismissViewControllerAnimated:NO completion:^{}];
        }
    }
    
}

- (IBAction)backBarButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:^{}];
    
}
@end
