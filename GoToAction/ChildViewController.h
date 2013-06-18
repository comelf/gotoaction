//
//  ChildViewController.h
//  GoToAction
//
//  Created by JungGang on 13. 5. 25..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "DBconnect.h"



@class ChildViewController;
@protocol ChildViewControllerDelegate
- (void)childViewControllerDidFinish:(ChildViewController *)controller;
@end

@interface ChildViewController : UIViewController
{
    int numIndex;
    DBconnect* DBinEV;
    int totalIdx;
    NSString* className;
    NSMutableArray *DBarray;
    BOOL RightorLeft;
    UIImageView *childView;
}
@property (weak, nonatomic) IBOutlet UILabel *textBox;
@property (weak, nonatomic) id <ChildViewControllerDelegate> delegate;
@property UITextField *titleBox;
- (IBAction)backButton:(id)sender;
- (IBAction)nextButton:(id)sender;
-(void) initDB:(DBconnect*)path array:(NSMutableArray*)array;
-(void) totalIndexinit:(int)num;
@property (strong, nonatomic) IBOutlet UINavigationItem *navigationBar;
- (IBAction)backBarButton:(id)sender;
-(void) ViewResize;
@end
