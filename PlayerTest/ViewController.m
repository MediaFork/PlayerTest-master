//
//  ViewController.m
//  PlayerTest
//
//  Created by wangwenke on 16/7/11.
//  Copyright © 2016年 wangwenke. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "XCAVPlayerView.h"

@interface ViewController ()

@property (nonatomic, strong) XCAVPlayerView *playerView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(statuesBarChanged:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    

    
    UIView *playBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.58)];
    [self.view addSubview:playBgView];
    [XCAVPlayerView shareManager].playerUrl = [NSURL URLWithString:@"http://pl.youku.com/playlist/m3u8?vid=452629757&type=3gphd&ts=1478681515&ep=eyaTEk%2BFV8sB4Cbfjj8bYCvqcXVdXPoP9BmHiNVnB9QgSeu7&sid=94786815155061277852b&token=4134&ctype=12&ev=1&oip=2067486600"];
    [XCAVPlayerView shareManager].videoTitle = @"测试视频一";
    [XCAVPlayerView startPlayInSuperView:playBgView];
    
    UISwitch *switchOne = [[UISwitch alloc]init];
    switchOne.on = YES;
    [switchOne addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchOne];
    [switchOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(playBgView.mas_bottom).with.offset(60.0);
    }];
    
    /*
    _playerView = [[XCAVPlayerView alloc]init];
    UIView *playBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.58)];
    [self.view addSubview:playBgView];
    self.playerView.frame = playBgView.bounds;
    [playBgView addSubview:self.playerView];
    self.playerView.playerUrl = [NSURL URLWithString:@"http://api.feixiong.tv/Api/Base/getShortM3u8?params=%7B%22data%22%3A%7B%22id%22%3A281%2C%22stream_type%22%3A%22hd2%22%2C%22ykss%22%3A%22%22%7D%7D"];
    [self.playerView play];
     */
    
}



- (void)statuesBarChanged:(NSNotification *)sender{
//    UIInterfaceOrientation statues = [UIApplication sharedApplication].statusBarOrientation;
//    if (statues == UIInterfaceOrientationPortrait || statues == UIInterfaceOrientationPortraitUpsideDown) {
//        self.playerView.frame = CGRectMake(0, 20.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.58);
//    }else if (statues == UIInterfaceOrientationLandscapeLeft || statues == UIInterfaceOrientationLandscapeRight){
//        self.playerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"%@--%@",object,[change description]);
}

- (void)moviePlayDidEnd:(NSNotification *)noti{
    
}

- (void)valueChanged:(UISwitch *)sender{
    NSURL *filePath = nil;
    if (sender.on) {
        [XCAVPlayerView shareManager].videoTitle = @"测试视频一";
        filePath = [NSURL URLWithString:@"http://pl.youku.com/playlist/m3u8?vid=452629757&type=3gphd&ts=1478681515&ep=eyaTEk%2BFV8sB4Cbfjj8bYCvqcXVdXPoP9BmHiNVnB9QgSeu7&sid=94786815155061277852b&token=4134&ctype=12&ev=1&oip=2067486600"];
    }else{
        [XCAVPlayerView shareManager].videoTitle = @"测试视频二...........................................................................................";
        filePath = [NSURL URLWithString:@"http://pl.youku.com/playlist/m3u8?vid=452696083&type=3gphd&ts=1478681586&ep=eyaTEk%2BFV8sI4yDeiT8bb33lJSYGXPoP9BmMh9JqA9QgSei2&sid=9478681586311128a7aa9&token=4109&ctype=12&ev=1&oip=2067486600"];
    }
    [XCAVPlayerView shareManager].playerUrl = filePath;
    [[XCAVPlayerView shareManager] play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
