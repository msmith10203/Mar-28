//
//  View.h
//  ColorMixer
//
//  Created by Mike Smith on 3/24/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    RED = 0,
    BLUE,
    Green
} Colors;

@interface View : UIView {
    UISwitch *mySwitch;
    UISlider *greenSlider;
    UISlider *redSlider;
    UISlider *blueSlider;
    UILabel *greenLabel;
    UILabel *redLabel;
    UILabel *blueLabel;
}

@property (strong, nonatomic) UISwitch *mySwitch;
@property (strong, nonatomic) UISlider *greenSlider;
@property (strong, nonatomic) UISlider *redSlider;
@property (strong, nonatomic) UISlider *blueSlider;

@end
