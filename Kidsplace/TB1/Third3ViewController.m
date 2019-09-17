//
//  Third3ViewController.m
//  儿童园地
//
//  Created by Air  wings on 2019/7/31.
//  Copyright © 2019 dlz. All rights reserved.
//
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#import "Third3ViewController.h"
#import <AVFoundation/AVSpeechSynthesis.h>

@interface Third3ViewController ()<AVSpeechSynthesizerDelegate>
@property(nonatomic,strong)UIButton * cancleButton;
@property(nonatomic,strong) AVSpeechSynthesizer *synthesizer;
@property(nonatomic,strong)AVSpeechUtterance *utterance;
@property (nonatomic,assign)BOOL isPlay;
@property(nonatomic,strong)UIButton * ActBtn;
@property(nonatomic,strong)UIButton * StopBtn;
@end

@implementation Third3ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"优秀作文";
    
    [self loadTextView];
    [self ActionBtn];
}

-(void)loadTextView{
    _textview = [[UITextView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-135)];
    _textview.text = _text;
    _textview.font = [UIFont fontWithName:@"Arial" size:22];
    _textview.textColor = [UIColor blackColor];
    _textview.backgroundColor = [UIColor whiteColor];
     _textview.editable = NO;
    [self.view addSubview:_textview];
}

-(void)setrightButton{
    
    _cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_cancleButton setTitle:@"取消阅读" forState:UIControlStateNormal];
    [_cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_cancleButton addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_cancleButton];
    rightItem.imageInsets = UIEdgeInsetsMake(0, -15,0, 0);//设置向左偏移
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

-(void)ActionBtn{
    self.ActBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT-60, 100, 50)];
    //self.ActBtn.backgroundColor = [UIColor orangeColor];
    [self.ActBtn setTitle:@"开始阅读" forState:UIControlStateNormal];
    [self.ActBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.ActBtn.layer.cornerRadius = 3.0;//2.0是圆角的弧度
    [self.ActBtn.layer setBorderColor:[UIColor blackColor].CGColor];//设置边框颜色
    self.ActBtn.layer.borderWidth = 1.0f;//设置边框颜色
    [self.ActBtn addTarget:self action:@selector(voiceBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.ActBtn];
}

-(void)stopBtn{
    self.StopBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-120, SCREEN_HEIGHT-60, 100, 50)];
    self.StopBtn.backgroundColor = [UIColor orangeColor];
    [self.StopBtn setTitle:@"暂停阅读" forState:UIControlStateNormal];
    [self.StopBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.StopBtn addTarget:self action:@selector(stopbtnClick:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.StopBtn];

}

-(void)voiceBtn:(UIButton *)btn{
    [self setrightButton];
    self.StopBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-120, SCREEN_HEIGHT-60, 100, 50)];
    
    [self.StopBtn setTitle:@"暂停阅读" forState:UIControlStateNormal];
    [self.StopBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.StopBtn.layer.cornerRadius = 3.0;//2.0是圆角的弧度
    [self.StopBtn.layer setBorderColor:[UIColor blackColor].CGColor];//设置边框颜色
    self.StopBtn.layer.borderWidth = 1.0f;
    [self.StopBtn addTarget:self action:@selector(stopbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.StopBtn];
    self.synthesizer = [[AVSpeechSynthesizer alloc]init];
    self.isPlay = NO;
    self.synthesizer.delegate = self;
    self.utterance = [[AVSpeechUtterance alloc]initWithString:_text];
    _utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    //语速0.0f~1.0f
    _utterance.rate = 0.5f;
    //声音的音调0.5f~2.0f
    _utterance.pitchMultiplier = 0.8f;
    //播放下下一句话的时候有多长时间的延迟
    _utterance.postUtteranceDelay = 0.1f;
    //上一句之前需要多久
    _utterance.preUtteranceDelay = 0.5f;
    //音量
    _utterance.volume = 1.0f;
    //开始播放
    [self.synthesizer speakUtterance:_utterance];
    
}

-(void)stopbtnClick:(UIButton *)btn{
    self.isPlay = !self.isPlay;
    if (self.isPlay) {
        [self.StopBtn setTitle:@"继续阅读" forState:UIControlStateNormal];
        [self.synthesizer  pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        
    }
    else{
        [self.StopBtn setTitle:@"暂停阅读" forState:UIControlStateNormal];
        [self.synthesizer continueSpeaking];
    }
}

-(void)cancelClick:(UIButton *)btn{
    [self.synthesizer  stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}


//开始朗读的代理方法
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}
//结束朗读的代理方法
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
   
    
}
//暂停朗读的代理方法
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}
//继续朗读的代理方法
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}
//取消朗读的代理方法
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
