//
//  ViewController.m
//  Tap
//
//  Created by Le Hoang Vinh on 5/11/17.
//  Copyright © 2017 Le Hoang Vinh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_title.png"]];
    scoreLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    timerLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
    buttonBeep=[self setupAudioPlayerWithFile: @"ButtonTap" type:@"wav"];
    secondBeep=[self setupAudioPlayerWithFile: @"SecondBeep" type:@"wav"];
    backgroundMusic=[self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    [self setup];
}

-(AVAudioPlayer *)setupAudioPlayerWithFile: (NSString*) file type:(NSString *)type
{
    NSString *path=[[NSBundle mainBundle] pathForResource:file ofType: type];
    NSURL *url=[NSURL fileURLWithPath:path];
    //
    NSError *error;
    //
    AVAudioPlayer *audioPlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    //
    if(!audioPlayer)
    {
        NSLog(@"%@ ",[error description]);
    }
    
    return audioPlayer;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed
{
    count++;
    scoreLabel.text=[NSString stringWithFormat:@"Socre\n%li",count];
    [buttonBeep play];
}
-(void) setup{
    count=0;
    second=30;
    
    timerLabel.text=[NSString stringWithFormat: @"Timer: %li",second];
    scoreLabel.text=[NSString stringWithFormat: @"Score \n%li",count];
    

    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil
                                            repeats:YES];
    [backgroundMusic play];
    [backgroundMusic setVolume:0.3];
    
}
-(void)subtractTime
{
    //1
    second--;
    [secondBeep play];
    timerLabel.text=[NSString stringWithFormat: @"Timer: %li",second];
    
    if(second==0)
    {
        [timer invalidate];
        UIAlertController *alert=[UIAlertController alertControllerWithTitle: @"Time's Up"
                                                                     message:[NSString stringWithFormat:@"Your Score is %li",count]
                                                              preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"Play Again!!"
                                                   style: UIAlertActionStyleDefault
                                                 handler:^(UIAlertAction *action)
                           {
                               [self setup];
                               [alert dismissViewControllerAnimated:YES completion:nil];
                           }];
        [alert addAction: ok];
        [self presentViewController: alert animated:YES completion: nil];
    }
}
@end
