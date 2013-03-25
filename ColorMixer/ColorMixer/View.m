//
//  View.m
//  ColorMixer
//
//  Created by Mike Smith on 3/24/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "View.h"

@implementation View

- (void) valueChanged: (id) sender {
	UISlider *s = sender;

    
	float red = (s.value - s.minimumValue)
    / (s.maximumValue - s.minimumValue);

/*
	slider.backgroundColor = [UIColor colorWithRed:
                              red green: 0.0 blue: 1.0 - red alpha: 1.0];
    
	label.text = [NSString stringWithFormat: @"%5.1f° F == %5.1f° C",
                  slider.value, CELSIUS(slider.value)];
*/ 
}
- (id)initWithFrame:(CGRect)frame
{
   	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		float minimumValue = 32;	//freezing point of water in Fahrenheit
		float maximumValue = 212;
        
		//Center the slider in the View.
		CGRect b = self.bounds;
		CGSize s = CGSizeMake(maximumValue - minimumValue, 16);
        
        
		CGRect greenFrame = CGRectMake(
                                      b.origin.x + (b.size.width - s.width) / 2,
                                      b.origin.y + (b.size.height - s.height) / 2,
                                      s.width,
                                      s.height
                                      );
		greenSlider = [[UISlider alloc] initWithFrame: greenFrame];
		greenSlider.minimumValue = minimumValue;
		greenSlider.maximumValue = maximumValue;
		greenSlider.value = (minimumValue + maximumValue) / 2;
		greenSlider.continuous = YES;	//default is YES
		CGFloat green = (greenSlider.value - greenSlider.minimumValue)
        / (greenSlider.maximumValue - greenSlider.minimumValue);
		greenSlider.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha: 1.0];
        greenSlider.minimumTrackTintColor    = [UIColor colorWithRed:0 green:1 blue:0 alpha:1.0];
        greenSlider.maximumTrackTintColor    = [UIColor colorWithRed:0 green:1 blue:0 alpha:1.0];
        
        NSString *text = @"Green";
        UIFont *font = [UIFont italicSystemFontOfSize:11];
        CGSize size = [text sizeWithFont: font];
        
        
        greenFrame.origin.x=0;
        greenLabel = [[UILabel alloc] initWithFrame:greenFrame];
        

        CGRect rect = [self color: @"green" label: greenLabel slider: greenSlider];

        
		CGRect blueFrame = CGRectMake(
                              b.origin.x + (b.size.width - s.width) / 2,
                              greenFrame.origin.y + greenFrame.size.height*2,
                              s.width,
                              s.height
                              );
		blueSlider = [[UISlider alloc] initWithFrame: blueFrame];
		blueSlider.minimumValue = minimumValue;
		blueSlider.maximumValue = maximumValue;
		blueSlider.value = (minimumValue + maximumValue) / 2;
		blueSlider.continuous = YES;	//default is YES
		CGFloat blue = (blueSlider.value - blueSlider.minimumValue)
        / (blueSlider.maximumValue - blueSlider.minimumValue);        
		blueSlider.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha: 1.0];
        blueSlider.minimumTrackTintColor    = [UIColor colorWithRed:0 green:0 blue:1 alpha:1.0];
        blueSlider.maximumTrackTintColor    = [UIColor colorWithRed:0 green:0 blue:1 alpha:1.0];
        
        CGRect redFrame = CGRectMake(
                              b.origin.x + (b.size.width - s.width) / 2,
                              greenFrame.origin.y + greenFrame.size.height*4,
                              s.width,
                              s.height
                              );
        redSlider = [[UISlider alloc] initWithFrame: redFrame];
		redSlider.minimumValue = minimumValue;
		redSlider.maximumValue = maximumValue;
		redSlider.value = (minimumValue + maximumValue) / 2;
		redSlider.continuous = YES;	//default is YES
        CGFloat red = (redSlider.value - redSlider.minimumValue)
        / (redSlider.maximumValue - redSlider.minimumValue);
		redSlider.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1.0];
        redSlider.minimumTrackTintColor    = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
        redSlider.maximumTrackTintColor    = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];

        
        
        
		//As the slider goes from the minimum to the maximum value,
		//red goes from 0 to 1.  Conversely, blue goes from 1 to 0.
       
//                                  blue green: 0.0 blue: 1.0 - blue alpha: 1.0];
        
		[slider addTarget:self
                   action: @selector(valueChanged:)
         forControlEvents: UIControlEventValueChanged
         ];
        
		[self addSubview: blueSlider];
        [self addSubview: redSlider];
        [self addSubview:greenSlider];

/*
		//Put the label above the slider
		//with a 10-pixel margin between them.
		UIFont *font = [UIFont fontWithName: @"Courier" size: 26];
		s = [@"123.4f° F == 123.4f° C" sizeWithFont: font];
        
		f = CGRectMake(
                       b.origin.x + (b.size.width - s.width) / 2,
                       b.origin.y + (b.size.height - slider.frame.size.height) / 2 - s.height - 10,
                       s.width,
                       s.height
                       );
        
		label = [[UILabel alloc] initWithFrame: f];
		label.textAlignment = UITextAlignmentCenter;
		label.font = font;
		[self valueChanged: slider];
		[self addSubview: label];
*/
        
        CGRect rect = [self color: @"green" label: greenLabel slider: greenSlider];
        
	}
	return self;

}

-(CGRect) color: (NSString *) clr label: (UILabel *) lbl slider: (UISlider *) sldr {
    CGRect ret = CGRectZero;
    if ([clr isEqualToString: @"green"]){
        ret.size.height=24;
        ret.size.width=25;
    } else if ([clr isEqualToString:@"blue"]) {
        
    } else {
        
        
    }
    return ret;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
