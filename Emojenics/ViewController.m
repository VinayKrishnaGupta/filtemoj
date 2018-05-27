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
    filter1.threshold = 0.8;
    filter1.quantizationLevels = 20;
  //  filter1.blurRadiusInPixels = 2.5;
    
    GPUImageSaturationFilter *filter2 = [[GPUImageSaturationFilter alloc] init];
    filter2.saturation = 0.5;
    
    [filter1 addTarget:filter2];
    
//    GPUImageGlassSphereFilter *filter3 = [[GPUImageGlassSphereFilter alloc] init];
//    filter3.radius = 0.4;
//    [filter2 addTarget:filter3];
    
    GPUImagePinchDistortionFilter *filter3 = [[GPUImagePinchDistortionFilter alloc]init];
    filter3.radius = 6;
    filter3.scale = -0.4    ;
    filter3.center = CGPointMake(0.48, 0.15);
      [filter2 addTarget:filter3];
//    //GPUImageZoomBlurFilter
//    GPUImageZoomBlurFilter *filter4 = [[GPUImageZoomBlurFilter alloc] init];
//
//    [filter3 addTarget:filter4];
//
    //
//    GPUImageWhiteBalanceFilter *filter4 = [[GPUImageWhiteBalanceFilter alloc] init];
//    filter4.temperature = 4900;
//    filter4.tint = 100;
//    [filter3 addTarget:filter4];
    
     GPUImageGammaFilter *filter4 = [[GPUImageGammaFilter alloc] init];
     filter4.gamma = 0.7;
  //  filter4.brightness = 0.5;
     [filter3 addTarget:filter4];
    
    GPUImageUnsharpMaskFilter *filter5 = [[GPUImageUnsharpMaskFilter alloc] init];
    filter5.intensity = 5;
  //  filter5.contrast = 0.8;
    [filter4 addTarget:filter5];
    
    GPUImagePosterizeFilter *filter6 = [[GPUImagePosterizeFilter alloc] init];
    filter6.colorLevels = 200;
    [filter5 addTarget:filter6];
    

  
    
    GPUImageFilterGroup *groupFilter = [[GPUImageFilterGroup alloc]init];
    [groupFilter addTarget:filter1];
    [groupFilter addTarget:filter2];
    [groupFilter addTarget:filter3];
    [groupFilter addTarget:filter4];
    [groupFilter addTarget:filter5];
    [groupFilter addTarget:filter6];
    [groupFilter setInitialFilters:[NSArray arrayWithObjects:filter1, nil]];
    [groupFilter setTerminalFilter:filter6];
    
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
