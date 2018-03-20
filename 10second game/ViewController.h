//
//  ViewController.h
//  10second game
//
//  Created by 安達康平 on 2016/03/11.
//  Copyright © 2016年 Kohei Adachi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController{
     AVAudioPlayer   *sound;
    
}
@property NSTimeInterval startTime;
- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)reset:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

