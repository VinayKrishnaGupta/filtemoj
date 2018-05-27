//
//  ViewController.m
//  Emojenics
//
//  Created by Vinay Krishna Gupta on 24/05/18.
//  Copyright © 2018 Vinay Krishna Gupta. All rights reserved.
//

#import "ViewController.h"
#import <GPUImage/GPUImage.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *filteredImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *inputImage = [UIImage imageNamed:@"sampleprofilepic1.jpg"];
    _filteredImageView.layer.cornerRadius = 100;
    _filteredImageView.layer.masksToBounds = true;
    
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
//    GPUImageToonFilter *filter1 = [[GPUImageToonFilter alloc] init];
//    filter1.threshold = 0.8;
//    filter1.quantizationLevels = 20;
//
    //GPUImageSmoothToonFilter
    GPUImageToonFilter *filter1 = [[GPUImageToonFilter alloc] init];
    filter1.threshold = 0.9;
    filter1.quantizationLevels = 7;
  //  filter1.blurRadiusInPixels = 2.5;
    
    GPUImageSaturationFilter *filter2 = [[GPUImageSaturationFilter alloc] init];
    filter2.saturation = 0.1;
    
    [filter1 addTarget:filter2];
    
//    GPUImageGlassSphereFilter *filter3 = [[GPUImageGlassSphereFilter alloc] init];
//    filter3.radius = 0.4;
//    [filter2 addTarget:filter3];
    
    GPUImagePinchDistortionFilter *filter3 = [[GPUImagePinchDistortionFilter alloc]init];
    filter3.radius = 4;
    filter3.scale = -0.3;
    filter3.center = CGPointMake(0.45, 0.43);
      [filter2 addTarget:filter3];
//    //GPUImageZoomBlurFilter
//    GPUImageZoomBlurFilter *filter4 = [[GPUImageZoomBlurFilter alloc] init];
//
//    [filter3 addTarget:filter4];
//
    //
    GPUImageWhiteBalanceFilter *filter4 = [[GPUImageWhiteBalanceFilter alloc] init];
    filter4.temperature = 4500;
    filter4.tint = 100;
    [filter3 addTarget:filter4];
  
    
    GPUImageFilterGroup *groupFilter = [[GPUImageFilterGroup alloc]init];
    [groupFilter addTarget:filter1];
    [groupFilter addTarget:filter2];
    [groupFilter addTarget:filter3];
    [groupFilter addTarget:filter4];
    [groupFilter setInitialFilters:[NSArray arrayWithObjects:filter1, nil]];
    [groupFilter setTerminalFilter:filter4];
    
    [groupFilter useNextFrameForImageCapture];
    [stillImageSource addTarget:groupFilter];
    [stillImageSource processImage];
    
    UIImage *currentFilteredVideoFrame = [groupFilter imageFromCurrentFramebuffer];
    _filteredImageView.image = currentFilteredVideoFrame;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
