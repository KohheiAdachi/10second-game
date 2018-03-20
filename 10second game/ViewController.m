//
//  ViewController.m
//  10second game
//
//  Created by 安達康平 on 2016/03/11.
//  Copyright © 2016年 Kohei Adachi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
 UIImageView *imageView1;
}

@end

@implementation ViewController{
    NSTimer *mTimer;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   //   NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
self.timer.text = @"10.000";
 [self timerSetUp];
}

- (void)timerSetUp {
    // 現在の時間を取得
    self.startTime= [NSDate timeIntervalSinceReferenceDate];
    self.timer.text = @"10.000";
 
    mTimer = [NSTimer scheduledTimerWithTimeInterval:0.001
                                              target:self
                                            selector:@selector(timeCounter)
                                            userInfo:nil
                                             repeats:YES];
    
}
- (void)timeCounter{
    double cTime = [NSDate timeIntervalSinceReferenceDate] - self.startTime;
    // int hour = cTime/(60*60);
    // doubleで余りを出す計算をするときはfmod
//    int minute = fmod((cTime/60), 60);
    int second = fmod(cTime, 60);
    int milisecond = (cTime - floor(cTime))*1000;
    int second1=9-second;
    int milisecond1=1000-milisecond;
    
    self.timer.text = [NSString stringWithFormat:@"%d.%03d", second1,milisecond1];
    //  self.timelabellog.text = [NSString stringWithFormat:@"%02d:%02d:%02d.%03d", hour, minute, second, milisecond];
    if (second==3) {
        [self sampleImageFadeIn];
      //  [self photos];
    }

}
    
    
- (IBAction)stop:(id)sender {
        [mTimer invalidate];
    _imageView.image=nil;
    double a = self.timer.text.floatValue;
    double abs = fabs(a);
    if (abs>=1) {   NSString *bgmPath =[[NSBundle mainBundle]pathForResource:@"banana1" ofType:@"mp3"];
        NSURL   *bgmurl =[NSURL fileURLWithPath:bgmPath];
        sound   =[[AVAudioPlayer alloc] initWithContentsOfURL:bgmurl error:nil];
        [sound  setNumberOfLoops:0];
        [sound play];
    }
    
}

- (IBAction)reset:(id)sender {
[mTimer invalidate];
    _imageView.image=nil;
self.timer.text = @"10.000";

}


- (void)sampleImageFadeIn
{
  
    
    imageView1=[UIImage imageNamed:@"black.jpg"];
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
    //   _imageView.backgroundColor=[UIColor lightGrayColor];
    _imageView.image=imageView1;
    
    //フェードイン
    _imageView.alpha = 0;
    //アニメーションのタイプを指定
    [UIView beginAnimations:@"fadeIn" context:nil];
    //イージング指定
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //アニメーション秒数を指定
    [UIView setAnimationDuration:0.9];
    //目標のアルファ値を指定
    _imageView.alpha = 1;
    //アニメーション実行
    [UIView commitAnimations];
}
@end
