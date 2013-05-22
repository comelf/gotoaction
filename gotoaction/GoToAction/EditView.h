//
//  EditView.h
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 20..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "InputBox.h"
#import "DBconnect.h"

@interface EditView : UIViewController <UIImagePickerControllerDelegate>
{
    InputBox *input;

    float value_x,value_y;
    int numIndex;
    DBconnect* DBinEV;
    int i;
    NSString* className;

}

@property (nonatomic, strong) IBOutlet UIScrollView *scrollViewPointer;
-(void) initDB:(DBconnect*)path;
-(IBAction)addClick:(id)sender;
-(IBAction)saveDB:(id)sender;

@end
