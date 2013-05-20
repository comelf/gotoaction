//
//  ViewController.m
//  WeAreBaby
//
//  Created by  byung-woo Lee on 13. 5. 17..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//@synthesize ;

-(IBAction)newTextFiled:(id)sendrt
{
    //좌표 증가 & 번호 증가
    view_x += 240;
    num +=1;
    
    //박스에 들어갈것들 좌표 설정
    textTitle[num] = [makeUI createTextFiled:(view_x-200) and:300 and:200 and:30];
    textContent[num]= [makeUI createTextView:(view_x-200) and:350 and:200 and:100];
    bg[num]=[makeUI createUiView:(view_x-210) and:40 and:220 and:500];
    
    //scrollview에 박스 출력
    [scrollView addSubview:bg[num]];
    [scrollView addSubview:textTitle[num]];
    [scrollView addSubview:textContent[num]];
    
    //박스가 4개 이상일때부터 스크롤뷰 크기 증가
    if(num>=4){
        scrollView.contentSize=CGSizeMake(768+((num-3)*240),1004);
    }
}
-(IBAction)checkFiled:(id)sendrt;
{
    //DB연동 확인 printf
    for (int i=1;i<=num;i++){
        NSLog(@"%@",textTitle[i].text);
        NSLog(@"%@\n",textContent[i].text);
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //스크롤뷰 생성 및 설정
    scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0.0f,0.0f,768.0f,1004.0f)];
    [self.view insertSubview:scrollView atIndex:0];
    
    //InputBox 객체 생성
    makeUI = [[InputBox alloc]init];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
