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
#import "InputBox.h"
#import "EditView.h"
@class ChildViewController;
@protocol ChildViewControllerDelegate
- (void)childViewControllerDidFinish:(ChildViewController *)controller;
@end

@interface ChildViewController : UIViewController
{
    InputBox* firstInput;
    InputBox* nextInput;
    NSMutableArray* inputList;
    int numIndex;
    DBconnect* DBinEV;
    int totalIdx;
    NSString* className;
    NSMutableArray *DBarray;
}
@property (weak, nonatomic) IBOutlet UIImageView *childView;
@property (strong, nonatomic) IBOutlet UILabel *titleBox;
@property (strong, nonatomic) IBOutlet UITextView *textBox;
@property BOOL loadData;
@property (weak, nonatomic) id <ChildViewControllerDelegate> delegate;
- (IBAction)backButton:(id)sender;
- (IBAction)nextButton:(id)sender;
-(void) initDB:(DBconnect*)path array:(NSMutableArray*)array;
-(void) totalIndexinit:(int)num;
@property (strong, nonatomic) IBOutlet UINavigationItem *navigationBar;
- (IBAction)backBarButton:(id)sender;
@end
