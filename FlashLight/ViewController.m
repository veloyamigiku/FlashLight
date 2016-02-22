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

- (IBAction)performLightSwitchAction:(id)sender
{
}

- (IBAction)performBrightnessSliderAction:(id)sender
{
}
@end
