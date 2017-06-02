//
//  ViewController.h
//  Tap
//
//  Created by Le Hoang Vinh on 5/11/17.
//  Copyright © 2017 Le Hoang Vinh. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>{
IBOutlet UILabel *timerLabel;
IBOutlet UILabel *scoreLabel;
    
    NSInteger count;
    NSInteger second;
    NSTimer *timer;
    
    //Add these AVAudioPlayer object!!
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundMusic;
}
-(IBAction) buttonPressed;


@end

