//
//  EditView.m
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 20..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import "EditView.h"

@implementation EditView
@synthesize popoverController, scrollViewPointer,loadData,deleteButton,buttonTag,imgAddButton,AddButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) totalIndexinit:(int)num
{
    totalIdx = num;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton * saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    saveButton.frame = CGRectMake(0,0,58,65);
    [saveButton addTarget:self action:@selector(saveDB:) forControlEvents:UIControlEventTouchUpInside];
    [saveButton setImage:[UIImage imageNamed:@"btn_done.png"]  forState:UIControlStateNormal];
    saveButton.imageEdgeInsets = UIEdgeInsetsMake(10, 0, -11, -10);
    
    UIBarButtonItem *Bar_saveButton = [[UIBarButtonItem alloc] initWithCustomView:saveButton];
    
    //UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"저장" style:UIBarButtonItemStylePlain target:self action:@selector(saveDB:)];
    self.navigationItem.rightBarButtonItem = Bar_saveButton;
    //[self.navigationController.navigationItem.backBarButtonItem setImage:[UIImage imageNamed:@"btn_back.png"]  forState:UIControlStateNormal];
    scrollViewPointer =[[UIScrollView alloc] init];

    [self.view insertSubview:scrollViewPointer atIndex:0];
    inputList = [[NSMutableArray alloc]init];
    DelButtonArray = [[NSMutableArray alloc]init];
    imgbuttonArray = [[NSMutableArray alloc]init];
    
    if(loadData==NO){
        [self scrollViewResize:numIndex];
        totalIdx= numIndex = 0;
        value_x = 30;
        value_y = 90;
        firstInput = [[InputBox alloc]init];
        [firstInput initCoordinate:numIndex x:value_x y:value_y scroll:scrollViewPointer DBinit:DBinEV];
        [firstInput createBox];
        firstInput.savedNum = 0;
        [firstInput textContent].text = @"상세한 설명을 넣어주세요.";
        [inputList addObject: firstInput];
        [self CreatedeleteButton:@"NULL"];
        numIndex =1;
    }
    else{
        //임시
        numIndex = 0;
        [self scrollViewResize:totalIdx];
        for (int i=0;i<totalIdx;i++){
            nextInput = [[InputBox alloc]init];
            nextInput.savedNum = numIndex;
            value_x = 30+(240*(numIndex));
            value_y = 90;
            [nextInput initCoordinate:(numIndex) x:value_x y:value_y scroll:scrollViewPointer DBinit:DBinEV];
            [nextInput createBox];
            [self CreatedeleteButton:DBarray[i][0]];
            //nextInput.textTitle.text = DBarray[i][0];
            nextInput.textContent.text = DBarray[i][1];
            [inputList addObject:nextInput];
            //[self CreatedeleteButton];
            numIndex +=1;
        }
    }
    
    //추가 버튼 생성
    AddButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* addimg = [UIImage imageNamed:@"addimg.png"];
    [AddButton setImage:addimg forState:UIControlStateNormal];
    AddButton.frame = CGRectMake(value_x+250,300,60,60);
    [AddButton addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollViewPointer addSubview:AddButton];
    // Do any additional setup after loading the view from its nib.
}
-(void) viewWillDisappear:(BOOL)animated
{
    [DBinEV deleteDBinId:record_id];
    for (int i=0; i<numIndex; i++) {
        //이미지 경로 저장
        UIImage* img = [[imgbuttonArray objectAtIndex:i] imageForState:UIControlStateNormal];
        NSString* number = [NSString stringWithFormat:@"gotoaction%03d%03d",record_id,i];     //숫자 변환
        NSString* directory =[NSString stringWithFormat:@"picture%03d",record_id];
        NSString* path = [self saveImage:img :directory :number];
        //NSString* imgPath=[imgbuttonArray];
        [[inputList objectAtIndex:i] dataSave:path dbId:record_id];
    }
}
-(void)popViewControllerWithAnimation {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if([self.navigationController.viewControllers objectAtIndex:0] != self)
    {
        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 58, 65)];
        [backButton setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
        [backButton setShowsTouchWhenHighlighted:TRUE];
        backButton.imageEdgeInsets = UIEdgeInsetsMake(10, -10, -11, 0);
        [backButton addTarget:self action:@selector(popViewControllerWithAnimation) forControlEvents:UIControlEventTouchDown];
        UIBarButtonItem *barBackItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        self.navigationItem.hidesBackButton = TRUE;
        self.navigationItem.leftBarButtonItem = barBackItem;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initDB:(DBconnect*)path array:(NSMutableArray*)array recordid:(int)fid
{
    DBinEV = path;
    DBarray = array;
    record_id = fid;
    
}
- (IBAction)addClick:(id)sender
{
    nextInput = [[InputBox alloc]init];
    value_x =30+(240*(numIndex));
    value_y = 90;
    [nextInput initCoordinate:(numIndex) x:value_x y:value_y scroll:scrollViewPointer DBinit:DBinEV];
    [nextInput createBox];
    
    [inputList addObject:nextInput];
    [self CreatedeleteButton:@"NULL"];
    numIndex +=1;
    [self scrollViewResize:numIndex];
    if(RightorLeft)
    {
        if(numIndex>4) [scrollViewPointer setContentOffset:CGPointMake((100+(numIndex-4)*240), 0) animated:YES];
    }else{
        if(numIndex>2) [scrollViewPointer setContentOffset:CGPointMake((100+(numIndex-3)*240), 0) animated:YES];
    }
    AddButton.frame = CGRectMake(value_x+250,300,60,60);
    
    
}
-(IBAction)saveDB:(id)sender
{
    /*
    [DBinEV deleteDBinId:record_id];
    for (int i=0; i<numIndex; i++) {
        //이미지 경로 저장
        UIImage* img = [[imgbuttonArray objectAtIndex:i] imageForState:UIControlStateNormal];
        NSString* number = [NSString stringWithFormat:@"gotoaction%03d%03d",record_id,i];     //숫자 변환
        NSString* directory =[NSString stringWithFormat:@"picture%03d",record_id];
        NSString* path = [self saveImage:img :directory :number];
        //NSString* imgPath=[imgbuttonArray];
        [[inputList objectAtIndex:i] dataSave:path dbId:record_id];
    }
     */
    [self dismissViewControllerAnimated:NO completion:^{}];
}
-(void) CreatedeleteButton:(NSString*)filepath
{
    //삭제 버튼 설정
    deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* delimg = [UIImage imageNamed:@"btn_erase.png"];
    [deleteButton setImage:delimg forState:UIControlStateNormal];
    deleteButton.frame = CGRectMake(value_x+200,value_y-20,40,40);
    deleteButton.tag = numIndex;
    [deleteButton addTarget:self action:@selector(deleteInputBox:) forControlEvents:UIControlEventTouchUpInside];
    [DelButtonArray addObject:deleteButton];
    if(numIndex>0){
        [scrollViewPointer addSubview:deleteButton];
    }
    
    //imgAddButton 설정
    imgAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imgAddButton setImage:[UIImage imageNamed:@"btn_camera.png"] forState:UIControlStateNormal];
    imgAddButton.frame = CGRectMake(value_x+10,value_y+40,200,200);
    imgAddButton.tag = numIndex;
    [imgAddButton addTarget:self action:@selector(imgAdd:) forControlEvents:UIControlEventTouchUpInside];
    if(![filepath isEqual:@"NULL"])
    {
        UIImage* tempimg = [[UIImage alloc] initWithContentsOfFile:filepath];
        [imgAddButton setImage:tempimg forState:UIControlStateNormal];
    }
    
    [imgbuttonArray addObject:imgAddButton];
    [scrollViewPointer addSubview:imgAddButton];
    
}


-(IBAction)deleteInputBox:(id)sender
{
    
    NSInteger Idx= [sender tag];
    [[inputList objectAtIndex:Idx] deleteBox];
    [inputList removeObjectAtIndex:Idx];
    
    [[DelButtonArray objectAtIndex:Idx] removeFromSuperview];
    [[imgbuttonArray objectAtIndex:Idx] removeFromSuperview];
    [DelButtonArray removeObjectAtIndex:Idx];
    [imgbuttonArray removeObjectAtIndex:Idx];

    
    //변경
    numIndex -=1;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];

    for(int i=Idx;i<numIndex;i++){
        value_x =30+(240*(i));
        [[inputList objectAtIndex:i] relocation:i];
        UIButton* tempDel = DelButtonArray[i];
        //NSLog(@"del버튼 %d를 %d로 변경",tempDel.tag,i);
        tempDel.tag = i;
        tempDel.frame = CGRectMake(value_x+200,value_y-20,40,40);
        [DelButtonArray replaceObjectAtIndex:i withObject:tempDel];
        UIButton* tempImg = imgbuttonArray[i];
        //NSLog(@"img버튼 %d를 %d로 변경",tempImg.tag,i);
        tempImg.tag = i;
        tempImg.frame = CGRectMake(value_x+10,value_y+40,200,200);
        [imgbuttonArray replaceObjectAtIndex:i withObject:tempImg];
    }
    [self scrollViewResize:numIndex];
    AddButton.frame = CGRectMake(280+(240*(numIndex-1)),300,60,60);
    [UIView  setAnimationDuration:0.0f];
    [self.view.layer removeAllAnimations];
    
}

-(IBAction)imgAdd :(id)sender
{
    UIActionSheet *myActionSheet;
    buttonTag = [sender tag];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        myActionSheet = [[UIActionSheet alloc]initWithTitle:@"선택"
                                                   delegate:self
                                          cancelButtonTitle:@"취소"
                                     destructiveButtonTitle:@"사진찍기"
                                          otherButtonTitles:@"사진첩에서 고르기", nil];
    }
    
    else if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]&&[UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        myActionSheet = [[UIActionSheet alloc]initWithTitle:@"선택" delegate:self cancelButtonTitle:@"취소" destructiveButtonTitle:nil otherButtonTitles:@"사진첩에서 고르기", nil ];
    }
    
    UIView *keyView = [[[[UIApplication sharedApplication] keyWindow] subviews] objectAtIndex:0];
    [myActionSheet showInView:keyView];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == [actionSheet cancelButtonIndex]) {
        return;
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    [imagePickerController setDelegate:self];
    
    if (buttonIndex == [actionSheet destructiveButtonIndex]) {
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        
    }
    
    else if (buttonIndex == [actionSheet firstOtherButtonIndex]) {
        
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [imagePickerController setAllowsEditing:YES];
    
    
    //아이폰의 경우 모달뷰로 출력
    //[self presentModalViewController:imagePickerController animated:YES];
    
    //아이패드의 경우 popover
    //현재 임의(zero)에 출력 향후 topbar로 변경
    UIView* newView = [[UIView alloc]init];
    [self.view addSubview:newView];
    self.popoverController = [[UIPopoverController alloc]initWithContentViewController:imagePickerController];
    self.popoverController.delegate = self;
    [self.popoverController presentPopoverFromRect:CGRectMake(100, 200, 100, 100) inView:newView permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    //[self.popoverController setPopoverContentSize:CGSizeMake(700, 700)];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *rectImage = [info objectForKey:UIImagePickerControllerEditedImage];
    [imgbuttonArray[buttonTag] setImage:rectImage forState:UIControlStateNormal];
    
    //[picker dismissModalViewControllerAnimated:YES];   //아이폰일때
}

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    //popoverController 제거
    self.popoverController = nil;
    [self.popoverController dismissPopoverAnimated:YES];
}

- (id) saveImage:(UIImage *)img :(NSString *)path :(NSString *)title
{

    NSString *docDir =
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                         NSUserDomainMask,YES)objectAtIndex:0];
    NSString *pngFilePath = [NSString stringWithFormat:@"%@/%@/%@.png",
                             docDir,path,title];

    //디렉토리 생성
    NSString *pngDirectoryPath = [NSString stringWithFormat:@"%@/%@",docDir,path];
    NSFileManager* fm = [NSFileManager defaultManager];
    
    BOOL result = [fm createDirectoryAtPath:pngDirectoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    
    //디렉토리 생성 확인용
    if (result)NSLog(@"create success");
    else NSLog(@"create fail");
    
    // 이미지 데이터 저장
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(img)];
    BOOL result2 = [imageData writeToFile:pngFilePath atomically:YES];
    // 저장 확인용
    if (result2) NSLog(@"copy success");
    else NSLog(@"copy fail");
    
    return pngFilePath;
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self scrollViewResize:numIndex];
}
-(void) scrollViewResize:(int)i
{
    RightorLeft =  NO;
    if(self.interfaceOrientation==UIInterfaceOrientationLandscapeLeft||self.interfaceOrientation==UIInterfaceOrientationLandscapeRight)
        RightorLeft = YES;
        
    if(([UIDevice currentDevice].orientation)==UIInterfaceOrientationLandscapeLeft||([UIDevice currentDevice].orientation)==UIInterfaceOrientationLandscapeRight)
        RightorLeft = YES;
    
    if(RightorLeft){
        scrollViewPointer.frame = CGRectMake(0, 0, 1024, 748);
        if(i>4){
            scrollViewPointer.contentSize = CGSizeMake(1124+((i-4)*240), 748);
        }
    }else{
        scrollViewPointer.frame = CGRectMake(0, 0, 768, 1004);
        if(i>2){
            scrollViewPointer.contentSize = CGSizeMake(668+((i-2)*240), 1004);
        }
    }
}

@end
