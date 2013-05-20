//
//  InputBox.m
//  WeAreBaby
//
//  Created by  byung-woo Lee on 13. 5. 17..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import "InputBox.h"

@implementation InputBox

-(id) createTextFiled:(float)filed_x
                  and:(float)filed_y
                  and:(float)filed_w
                  and:(float)filed_h
{
    tf = [[UITextField alloc] initWithFrame:CGRectMake(filed_x,filed_y,filed_w,filed_h)];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    
    //tf.placeholder = @"abc";
    return tf;
}
-(id) createUiView:(float)filed_x
               and:(float)filed_y
               and:(float)filed_w
               and:(float)filed_h
{
    uv = [[UIView alloc] initWithFrame:CGRectMake(filed_x,filed_y,filed_w,filed_h)];
    uv.backgroundColor =[UIColor colorWithRed:0.0f green:102.0f blue:20.0f alpha:1.0f];
    return uv;
}
-(id) createTextView:(float)filed_x
                 and:(float)filed_y
                 and:(float)filed_w
                 and:(float)filed_h
{
    tv = [[UITextView alloc] initWithFrame:CGRectMake(filed_x,filed_y,filed_w,filed_h)];
    tv.backgroundColor=[UIColor colorWithRed:100.0 green:100.0 blue:100.0 alpha:1.0];
    [tv setFont:[UIFont fontWithName:@"Helvetica" size:25]];
    return tv;
}
-(void) initCoordinate:(int)numidx
                     x:(float)_x
                     y:(float)_y
                 width:(float)_w
                 hight:(float)_h
{
    numIndex = numidx;
    value_x = _x;
    value_y = _y;
    value_w = _w;
    value_h = _h;
}
@end
