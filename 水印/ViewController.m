//
//  ViewController.m
//  水印
//
//  Created by Gate on 16/1/2.
//  Copyright © 2016年 Gate. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+lcx.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *newImage = [UIImage waterImageWithBg:@"scene" andWater:@"logo" andTitle:@"呀呀呀呀呀呀呀呀呀"];
    UIGraphicsEndImageContext();
    self.imageView.image = newImage;
    
    NSData *data = UIImagePNGRepresentation(newImage);
    
    [data writeToFile:@"/Users/LuChangxiang/Desktop/未命名文件夹/scene.png" atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clip:(id)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIImage *newImage = [UIImage captureWithView:self.view];
        
        NSData *data = UIImagePNGRepresentation(newImage);
        [data writeToFile:@"/Users/LuChangxiang/Desktop/未命名文件夹/666.png" atomically:YES];
        
    });
}

@end
