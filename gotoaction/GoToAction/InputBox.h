//
//  InputBox.h
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 21..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBconnect.h"
@interface InputBox : NSObject <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIView *bg;
    UIScrollView *scrollViewPointer;
    int numIndex;
    float value_x,value_y;
    DBconnect* DBinIB;


}
@property UITextField *textTitle;
@property UITextView *textContent;
@property int savedNum;
-(void) initCoordinate:(int)numidx
                     x:(float)_x
                     y:(float)_y
                scroll:(UIScrollView*)mainScrollView
                DBinit:(DBconnect*)db;
-(void) createBox;
-(void) dataSave:(NSString*)imgPath;
-(void) deleteBox;
-(IBAction)imgAdd :(id)sender;
-(void) relocation:(int)num;
@end
