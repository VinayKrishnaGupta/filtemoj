//
//  EmojieeViewController.m
//  Emojenics
//
//  Created by Vinay Krishna Gupta on 30/05/18.
//  Copyright © 2018 Vinay Krishna Gupta. All rights reserved.
//

#import "EmojieeViewController.h"

@interface EmojieeViewController ()

@end

@implementation EmojieeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self ApplyGPUImageNEwFilters];
    [self ApplyGPUImageNEwFilters];
    // Do any additional setup after loading the view.
}
-(void)ApplyGPUImageNEwFilters
{
    //    UIImage *inputImage = [UIImage imageNamed:@"samplemen"];
    NSLog(@" New Image Size %@", _ClickedImage1);
    _filteredImageView.autoresizingMask = UIAccessibilityTraitNone;
    
    _filteredImageView.layer.cornerRadius = 150;
    _filteredImageView.layer.masksToBounds = true;
    
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:_ClickedImage1];
    
    GPUImageGaussianBlurFilter *filter1 = [[GPUImageGaussianBlurFilter alloc] init];
    //    filter1.blurRadiusInPixels = 3;
    //    filter1.blurPasses = 2;
    
    
    GPUImageBilateralFilter *filter2 = [[GPUImageBilateralFilter alloc] init];
    filter2.distanceNormalizationFactor = 4;
    filter2.texelSpacingMultiplier = 4;
    [filter1 addTarget:filter2];
    
    GPUImagePinchDistortionFilter *filter3 = [[GPUImagePinchDistortionFilter alloc]init];
    filter3.radius = 1;
    filter3.scale = -0.4    ;
    filter3.center = CGPointMake(0.48, 0.15);
    [filter2 addTarget:filter3];
    
    
    GPUImageToonFilter *filter4 = [[GPUImageToonFilter alloc] init];
    filter4.threshold = 0.5;
    filter4.quantizationLevels = 20;
    [filter3 addTarget:filter4];
    
    GPUImageWhiteBalanceFilter *filter5 = [[GPUImageWhiteBalanceFilter alloc] init];
    filter5.temperature = 4500;
    filter5.tint = 50;
    
    [filter4 addTarget:filter5];
    
    
    GPUImageFilterGroup *groupFilter = [[GPUImageFilterGroup alloc]init];
    [groupFilter addTarget:filter1];
    [groupFilter addTarget:filter2];
    [groupFilter addTarget:filter3];
    [groupFilter addTarget:filter4];
    [groupFilter addTarget:filter5];
    
    [groupFilter setInitialFilters:[NSArray arrayWithObjects:filter1, nil]];
    [groupFilter setTerminalFilter:filter5];
    
    [groupFilter useNextFrameForImageCapture];
    [stillImageSource addTarget:groupFilter];
    [stillImageSource processImage];
    
    UIImage *currentFilteredVideoFrame = [groupFilter imageFromCurrentFramebuffer];
    _filteredImageView.image = currentFilteredVideoFrame;
}

-(void)ApplyGPUImageFilterOne
{
    //    UIImage *inputImage = [UIImage imageNamed:@"samplemen.png"];
    //    _filteredImageView.layer.cornerRadius = 150;
    //    _filteredImageView.layer.masksToBounds = true;
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:_ClickedImage1];
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
    filter2.saturation = 1.5;
    
    [filter1 addTarget:filter2];
    
    //    GPUImageGlassSphereFilter *filter3 = [[GPUImageGlassSphereFilter alloc] init];
    //    filter3.radius = 0.4;
    //    [filter2 addTarget:filter3];
    
    GPUImagePinchDistortionFilter *filter3 = [[GPUImagePinchDistortionFilter alloc]init];
    filter3.radius = 1;
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
    filter4.gamma = 1.7;
    //  filter4.brightness = 0.5;
    [filter3 addTarget:filter4];
    
    GPUImageUnsharpMaskFilter *filter5 = [[GPUImageUnsharpMaskFilter alloc] init];
    filter5.intensity = 5;
    filter5.blurRadiusInPixels = 5;
    //  filter5.contrast = 0.8;
    [filter4 addTarget:filter5];
    
    GPUImagePosterizeFilter *filter6 = [[GPUImagePosterizeFilter alloc] init];
    filter6.colorLevels = 25;
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
