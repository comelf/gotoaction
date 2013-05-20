//
//  InputBox.h
//  WeAreBaby
//
//  Created by  byung-woo Lee on 13. 5. 17..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface InputBox : NSObject
{
    UITextField *tf;
    UIView *uv;
    UITextView *tv;
    float value_x,value_y,value_w,value_h;
    int numIndex;
}
-(void) initCoordinate:(int)num
                     x:(float)_x
                     y:(float)_y
                 width:(float)_w
                 hight:(float)_h;
-(id) createTextFiled:(float)filed_x
                and:(float)filed_y
                and:(float)filed_w
                and:(float)filed_h;
-(id) createUiView:(float)filed_x
                and:(float)filed_y
                and:(float)filed_w
                and:(float)filed_h;
-(id) createTextView:(float)filed_x
                and:(float)filed_y
                and:(float)filed_w
                and:(float)filed_h;

@end
