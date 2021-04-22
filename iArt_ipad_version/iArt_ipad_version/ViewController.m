//
//  ViewController.m
//  SketchBookPro
//
//  Created by Janae on 15/12/18.
//  Copyright © 2015年 zhiyuan. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
//    UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//
//    imageView.image = [[UIImage imageNamed:@"drawboard.png"] stretchableImageWithLeftCapWidth:CGRectGetWidth(self.view.frame) topCapHeight:[self.view bounds].size.height];
//
//    [self.view addSubview:imageView];
    
//    DrawView * aView = [[DrawView alloc]initWithFrame:CGRectMake(0, 0,  CGRectGetWidth(self.view.frame), [self.view bounds].size.height)];
    DrawView * aView = [[DrawView alloc]initWithFrame:CGRectMake(0, 0,  CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
//    UIImageView * imageview = [[UIImageView alloc]initWithFrame:self.view.bounds];
//    imageview.image = [UIImage imageNamed:@"drawboard.png"];
//    [aView addSubview:imageview];
    UIColor * color = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"newnewnewdrawboard.png"]];
    [aView setBackgroundColor:color];
    //UIImage * image = [UIImage imageNamed:@"drawboard.png"];
    //aView.layer.contents = (id)image.CGImage;
    //aView.layer.backgroundColor = [UIColor clearColor].CGColor;
    [self.view addSubview:aView];
    
    
    CGRect rect = CGRectMake(10, 20, 50, 30);
    UIButton * backbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backbutton setFrame:rect];
    //[self.view addSubview:backbutton];
    [backbutton setTitle:@"返回" forState:UIControlStateNormal];
    [backbutton addTarget:self action:@selector(backview) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect rect1 = CGRectMake(CGRectGetWidth(self.view.frame)-45, 425, 50, 30);
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:rect1];
    [self.view addSubview:button1];
    [button1 setTitle:@"撤销" forState:UIControlStateNormal];
    [button1 addTarget:aView action:@selector(romoveClean:) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect rect2 = CGRectMake(CGRectGetWidth(self.view.frame)-45, 610, 50, 30);
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:rect2];
    [self.view addSubview:button2];
    [button2 setTitle:@"清屏" forState:UIControlStateNormal];
    [button2 addTarget:aView action:@selector(romoveLine:) forControlEvents:UIControlEventTouchUpInside];
    
    
    CGRect rect3 = CGRectMake(715, 60, 50, 30);
    UIButton * savebutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [savebutton setFrame:rect3];
    [self.view addSubview:savebutton];
    [savebutton setTitle:@"保存" forState:UIControlStateNormal];
    [savebutton addTarget:self action:@selector(saveview) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)saveview{
    [self makeScreenShotCompletion:^(UIImage *image) {
        //self.view.image = image;
    }];
}

- (void)backview{

    [self.navigationController popViewControllerAnimated:YES];
   //printf("测试打印");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//这里的图片可以是本地图片也可以是网络的图片，网络的需要通过SD转化
//UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{

    if (error == nil) {

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已存入手机相册" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // Do something after clicking OK button
            UITextField *textField = alert.textFields.firstObject;
        }];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已存入手机相册" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//        [alert show];

    }else{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // Do something after clicking OK button
            UITextField *textField = alert.textFields.firstObject;
        }];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
        

//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"保存失败" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//        [alert show];
    }

}


//这是一个含block的方法，使用时可以通过这个方法拿到保存屏幕截图成功失败后的回调，进而做出某些操作。此处的selector方法和上面的一样，也是上一个方法的延伸，设置保存的区域大小
/**
 *  简单截屏并将图片保存到本地
 */
-(void)makeScreenShotCompletion:(void(^)(UIImage * image))completion{
    //开启上下文  <span style="font-family: Arial, Helvetica, sans-serif;">设置截屏大小</span>
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //获取图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    completion(image);

    /**
     *  将图片保存到本地相册
     */
    UIImageWriteToSavedPhotosAlbum(image, self , @selector(image:didFinishSavingWithError:contextInfo:), nil);//保存图片到照片库

}


@end
