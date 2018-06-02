//
//  EmojieeViewController.h
//  Emojenics
//
//  Created by Vinay Krishna Gupta on 30/05/18.
//  Copyright © 2018 Vinay Krishna Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GPUImage/GPUImage.h>

@interface EmojieeViewController : UIViewController
@property(nonatomic, retain) UIImage* ClickedImage1;
@property (weak, nonatomic) IBOutlet UIImageView *filteredImageView;
@end
