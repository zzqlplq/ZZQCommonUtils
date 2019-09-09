//
//  ViewController.m
//  ZZQCommonUtilDemo
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ZZQExtension.h"
#import "UIButton+ZZQImagePosition.h"
#import "UIView+AlertController.h"
#import "UIView+ZZQExtension.h"
#import "NSDate+ZZQExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageWithColor:[UIColor blueColor] size:CGSizeMake(40, 40)];
    image = [image rounded];
    
    UIButton *sender = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    NSString *dateString = [[NSDate dateTomorrow] stringWithDateFormatter:@"yyyy-dd-mm"];
    [sender setImage:image forState:UIControlStateNormal];
    [sender setTitle:dateString forState:UIControlStateNormal];
    
    sender.backgroundColor = [UIColor redColor];
    
    [sender setImagePosition:ZZQImagePositionTop spacing:8];
    
    [sender addTarget:self action:@selector(senderClick:) forControlEvents:UIControlEventTouchUpInside];

//    [sender maskLayerRounded:10 borderWidth:3 borderColor:[UIColor yellowColor]];
    [sender addGradientColors:@[[UIColor blueColor], [UIColor redColor]] startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 1)];
    
    //    [sender rounded:10 width:3 color:[UIColor yellowColor]];
 //   [sender border:3 color:[UIColor yellowColor]];
//    [sender rounded:10];

    [self.view addSubview:sender];
    
  //  [sender rounded:10 andShadow:[UIColor blackColor] opacity:0.5 radius:5 offset:CGSizeMake(2, 10)];
}


- (void)senderClick:(UIButton *)sender {
    
    [self showAlertWithTitle:@"提示" message:@"按钮点击" confirmHandler:^(UIAlertAction * _Nonnull confirmAction) {
        NSLog(@"点击成功");
    }];
    
}

@end
