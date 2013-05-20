//
//  ViewController.h
//  WeAreBaby
//
//  Created by  byung-woo Lee on 13. 5. 17..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBconnect.h"
#import "InputBox.h"

@interface ViewController : UIViewController
{
    UITextField* textTitle[30];
    UITextView* textContent[30];
    UIView* bg[30];
    UIScrollView* scrollView;
    id makeUI;
    float view_x;
    int num;
}

-(IBAction)saveDB:(id)sender;
-(IBAction)newTextFiled:(id)sendrt;
-(IBAction)checkFiled:(id)sendrt;
@end
