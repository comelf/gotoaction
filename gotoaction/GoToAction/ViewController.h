//
//  ViewController.h
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 20..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditView.h"
#import "DBconnect.h"
#import "ChildViewController.h"
@interface ViewController : UIViewController
{
    DBconnect* DB;
    NSMutableArray* DBin;
    int maxRecord;
    int total;
}

- (IBAction)newClick:(id)sender;
- (IBAction)loadClick:(id)sender;
- (IBAction)forChildPage:(id)sender;
@end
