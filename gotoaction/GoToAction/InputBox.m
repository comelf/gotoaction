//
//  InputBox.m
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 21..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import "InputBox.h"

@implementation InputBox
@synthesize textTitle,textContent,savedNum;

-(void) initCoordinate:(int)numidx
                     x:(float)_x
                     y:(float)_y
                scroll:(UIScrollView*)mainScrollView
                DBinit:(DBconnect*)db
{
    numIndex = numidx;
    value_x = _x;
    value_y = _y;
    scrollViewPointer = mainScrollView;
    DBinIB = db;

    //title 설정
    textTitle = [[UITextField alloc] initWithFrame:CGRectMake(value_x+10, value_y+255,200,30)];
    textTitle.borderStyle = UITextBorderStyleRoundedRect;
    
    //background_view 설정
    bg = [[UIView alloc] initWithFrame:CGRectMake(value_x,value_y,220,500)];
    bg.backgroundColor =[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.7f];
    
    //textContent 설정
    textContent = [[UITextView alloc] initWithFrame:CGRectMake(value_x+10,value_y+300,200,100)];
    textContent.backgroundColor=[UIColor colorWithRed:100.0 green:100.0 blue:100.0 alpha:1.0];
    [textContent setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    

}

-(void) createBox
{
    //화면 출력
    [scrollViewPointer addSubview:bg];
    [scrollViewPointer addSubview:textTitle];
    [scrollViewPointer addSubview:textContent];


}


-(void) dataSave:(NSString*)imgPath
{
    /*
    if(numIndex<savedNum)
    {
        [DBinIB updateDB:numIndex title:textTitle.text content:textContent.text];
    }
    else{
    */
        [DBinIB saveDB:numIndex title:imgPath content:textContent.text];
    //}
    NSLog(@"%d, %@, %@",numIndex,imgPath,textContent.text);
}

-(void) deleteBox
{
    textContent.removeFromSuperview;
    textTitle.removeFromSuperview;
    bg.removeFromSuperview;
    
    NSLog(@"delete");
}
-(void) relocation:(int)num
{
    
    numIndex = num;
    value_x = 30+(240*(numIndex));
    textTitle.frame = CGRectMake(value_x+10, value_y+255,200,30);
    bg.frame = CGRectMake(value_x,value_y,220,500);
    textContent.frame = CGRectMake(value_x+10,value_y+300,200,100);
}

@end
