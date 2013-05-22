//
//  InputBox.h
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 21..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBconnect.h"
@interface InputBox : NSObject
{
    UITextField *textTitle;
    UIView *bg;
    UITextView *textContent;
    UIScrollView *scrollViewPointer;
    int numIndex;
    float value_x,value_y;
    DBconnect* DBinIB;
    InputBox* next;

}


-(void) initCoordinate:(int)numidx
                     x:(float)_x
                     y:(float)_y
                scroll:(UIScrollView*)mainScrollView
                DBinit:(DBconnect*)db;
-(void) createBox;
-(void) addNext;
-(void) removeBox;
-(void) addLast;
-(void) printlog;
@end
