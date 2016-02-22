//
//  ViewController.m
//  FlashLight
//
//  Created on 2016/02/22.
//
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *lightSwitch;

@property (weak, nonatomic) IBOutlet UISlider *brightnessSlider;

- (IBAction)performLightSwitchAction:(id)sender;

- (IBAction)performBrightnessSliderAction:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self becomeFirstResponder];
}

- (IBAction)performLightSwitchAction:(id)sender
{
    // ライト制御を実行します。
    [self configureLight];
}

- (IBAction)performBrightnessSliderAction:(id)sender
{
    // ライト制御を実行します。
    [self configureLight];
}

/**
 *  もージョンイベント終了時の処理です。
 *
 *  @param motion モーションです。
 *  @param event  イベントです。
 */
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    // シェイクジェスチャを認識した時の処理です。
    if (motion == UIEventSubtypeMotionShake)
    {
        // スイッチのON/OFFを切り替えます。
        [self.lightSwitch setOn:!self.lightSwitch.isOn animated:YES];
        
        // ライト制御を実行します。
        [self configureLight];
    }
}

/**
 *  ファーストレスポンダとして設定します。
 *
 *  @return ファーストレスポンダの有効フラグ。
 */
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)configureLight
{
    NSError *error = nil;
    
    // ビデオデバイスを取得します。
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // 各コントローラから値を取得します。
    BOOL isOn = self.lightSwitch.isOn;
    float level = self.brightnessSlider.value;
    
    // トーチを持ったデバイスが正しく取得できた場合の処理です。
    if (device && device.hasTorch) {
        // デバイスをロックします。
        [device lockForConfiguration:&error];
        
        if (level > 0.0f && isOn) {
            // トーチの明るさを設定します。
            [device setTorchModeOnWithLevel:level error:&error];
        }
        else
        {
            // トーチをオフにします。
            device.torchMode = AVCaptureTorchModeOff;
        }
        
        // ロックを解除します。
        [device unlockForConfiguration];
    }
}

@end
