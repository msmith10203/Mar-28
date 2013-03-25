//
//  View.h
//  ColorMixer
//
//  Created by Mike Smith on 3/24/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView {
    UISlider *redSlider;
	UILabel *redLabel;
    UISlider *greenSlider;
	UILabel *greenLabel;
    UISlider *blueSlider;
	UILabel *blueLabel;
    UIButton *mixButton;
    
    UILabel *label;
    UISlider *slider;
}

@end
