//
//  View.m
//  ColorMixer
//
//  Created by Mike Smith on 3/24/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//
#import "MixAppDelegate.h"
#import "View.h"

@implementation View

enum color {red, blue, green};

- (void) redValueChanged: (id) sender {
	UISlider *s = sender;

    MixAppDelegate *app = [UIApplication sharedApplication].delegate;
    
	app.red = (s.value - s.minimumValue)
    / (s.maximumValue - s.minimumValue);
    
    self.backgroundColor = [UIColor colorWithRed:
                            app.red green: app.green blue: app.blue alpha: 1.0];
}

- (void) blueValueChanged: (id) sender {
	UISlider *s = sender;
    
    MixAppDelegate *app = [UIApplication sharedApplication].delegate;
    
	app.blue = (s.value - s.minimumValue)
    / (s.maximumValue - s.minimumValue);
    
    self.backgroundColor = [UIColor colorWithRed:
                                             app.red green: app.green blue: app.blue alpha: 1.0];
}

- (void) greenValueChanged: (id) sender {
	UISlider *s = sender;
    
    MixAppDelegate *app = [UIApplication sharedApplication].delegate;
    
	app.green = (s.value - s.minimumValue)
    / (s.maximumValue - s.minimumValue);

    self.backgroundColor = [UIColor colorWithRed:
                            app.red green: app.green blue: app.blue alpha: 1.0];
}

- (id)initWithFrame:(CGRect)frame
{
   	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		float minimumValue = 0;	//freezing point of water in Fahrenheit
		float maximumValue = 100;
        
		//Center the slider in the View.
		CGRect b = self.bounds;
        
        NSString *headerText = @"  Screen Color Picker ";
        UIFont *headerFont = [UIFont italicSystemFontOfSize: 16];
        CGSize size = [headerText sizeWithFont: headerFont];
        
        CGRect f = CGRectMake(
                              80,
                              130,
                              size.width,
                              size.height
                              );
        
        UILabel *scrLabel = [[UILabel alloc] initWithFrame: f];
        scrLabel.font = headerFont;
        scrLabel.backgroundColor = [UIColor clearColor];
        scrLabel.textColor = [UIColor whiteColor];
        scrLabel.text = headerText;
        [self addSubview: scrLabel];
        
        [self installSwitchX: 170 installSwitchY: 170];
        
        NSString *text = @"Green ";
        UIFont *font = [UIFont italicSystemFontOfSize:18];
        CGSize greenLabelSize = [text sizeWithFont: font];
        CGRect greenLabelFrame = CGRectZero;
		CGSize greenSliderSize = CGSizeMake(maximumValue - minimumValue, 16);
        CGRect greenSliderFrame = CGRectZero;
        
        greenSliderFrame = [self labelSize: greenLabelSize sliderSize: greenSliderSize boundsRect: b labelCGRect: &greenLabelFrame yIncrement: -20 xIncrement: 0];
                
        UILabel *greenLabel = [[UILabel alloc] initWithFrame:greenLabelFrame];
        UISlider *greenSlider = [[UISlider alloc] initWithFrame: greenSliderFrame];

        [self bgColor:Green initSlider: greenSlider initLabel: greenLabel color: [UIColor greenColor]
                redColor: 0 greenColor: 1 blueColor: 0 text: @"Green" font: font maximumValue: maximumValue minimumValue: minimumValue];
        
        NSString *text2 = @"Blue ";
        UIFont *font2 = [UIFont italicSystemFontOfSize:18];
        CGSize blueLabelSize = [text2 sizeWithFont: font2];
        CGRect blueLabelFrame = CGRectZero;
		CGSize blueSliderSize = CGSizeMake(maximumValue - minimumValue, 16);
        CGRect blueSliderFrame = CGRectZero;
        
        blueSliderFrame = [self labelSize: blueLabelSize sliderSize: blueSliderSize boundsRect: b labelCGRect: &blueLabelFrame
                              labelOrigin: greenLabelFrame.origin sliderOrigin:greenSliderFrame.origin yIncrement: 40];
        
        UILabel *blueLabel = [[UILabel alloc] initWithFrame:blueLabelFrame];
        UISlider *blueSlider = [[UISlider alloc] initWithFrame: blueSliderFrame];
        
        [self bgColor: BLUE initSlider: blueSlider initLabel: blueLabel color: [UIColor blueColor]
                redColor: 0 greenColor: 0 blueColor: 1 text: @"Blue" font: font maximumValue: maximumValue minimumValue: minimumValue];
       
        NSString *text3 = @"Red ";
        UIFont *font3 = [UIFont italicSystemFontOfSize:18];
        CGSize redLabelSize = [text3 sizeWithFont: font3];
        CGRect redLabelFrame = CGRectZero;
		CGSize redSliderSize = CGSizeMake(maximumValue - minimumValue, 16);
        CGRect redSliderFrame = CGRectZero;
        
        redSliderFrame = [self labelSize: redLabelSize sliderSize: redSliderSize boundsRect: b labelCGRect: &redLabelFrame
                             labelOrigin: greenLabelFrame.origin sliderOrigin: greenSliderFrame.origin yIncrement:80];
        
        UILabel *redLabel = [[UILabel alloc] initWithFrame:redLabelFrame];
        UISlider *redSlider = [[UISlider alloc] initWithFrame: redSliderFrame];
        
        [self bgColor: RED initSlider: redSlider initLabel: redLabel color: [UIColor redColor]
                redColor: 1 greenColor: 0 blueColor: 0 text: @"Red" font: font maximumValue: maximumValue minimumValue: minimumValue];
	}
	return self;

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //Fill a right triangle.
	CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat length = min * 5 / 8;           //of side
    
	CGContextRef c = UIGraphicsGetCurrentContext();
    
	//origin at right angle
	CGContextTranslateCTM(c,
                          (size.width + length) / 2,
                          (size.height + length) / 2
                          );
	CGContextScaleCTM(c, 1, -1);
    
	CGContextBeginPath(c);
	CGContextMoveToPoint(c, 0, 0);          //lower right vertex (the right angle)
	CGContextAddLineToPoint(c, 0, length);  //upper right vertex
    CGContextAddLineToPoint(c, -length, length);  // upper left vertex
	CGContextAddLineToPoint(c, -length, 0); //lower left vertex
	CGContextClosePath(c);                  //back to starting point
    
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);
	CGContextFillPath(c);
}

-(void) installSwitchX: (float) x installSwitchY: (int) y
{
    //Do not specify a size for the switch.
    //Let the switch assume its own natural size.
    UISwitch *mySwitch = [[UISwitch alloc] initWithFrame: CGRectZero];
    if (mySwitch == nil) {
        return;
    }
    
    //Call the valueChanged: method of the application delegate
    //when the value of the switch is changed.
    
    [mySwitch addTarget: [UIApplication sharedApplication].delegate
                 action: @selector(switchValueChanged:)
       forControlEvents: UIControlEventValueChanged
     ];
    
    mySwitch.center = CGPointMake(
                                  x,
                                  y
                                  );
    
    mySwitch.on = NO;	//the default
    [self addSubview: mySwitch];
}

-(void) bgColor: (Colors) bgClr initSlider: (UISlider*) slider initLabel: (UILabel*) label color: (UIColor*) clr
               redColor: (int) red greenColor: (int) green blueColor: (int) blue text: (NSString*) txt font: (UIFont*) fnt
      maximumValue: (float) max minimumValue:(float) min {
    
    label.font = fnt;
    label.backgroundColor = clr;
    label.textColor = [UIColor blackColor];
    label.text = txt;
    [self addSubview:label];
    
    slider.minimumValue = min;
    slider.maximumValue = max;
    slider.value = (min + max) / 2;
    slider.continuous = YES;
    slider.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha: 1.0];
    slider.minimumTrackTintColor    = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    slider.maximumTrackTintColor    = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    //CGColorRef colorRef = [UIColor redColor].CGColor;
    //NSString *colorString = [CIColor colorWithCGColor:colorRef].stringRepresentation;
    
    if (bgClr == RED){
        [slider addTarget:self
                   action: @selector(redValueChanged:)
                forControlEvents: UIControlEventValueChanged
         ];
    } else if (bgClr==BLUE) {
        [slider addTarget:self
                   action: @selector(blueValueChanged:)
         forControlEvents: UIControlEventValueChanged
         ];
    } else if (bgClr==Green){
        [slider addTarget:self
                   action: @selector(greenValueChanged:)
         forControlEvents: UIControlEventValueChanged
         ];    }
    [self addSubview:slider];
    
}

-(CGRect) labelSize: (CGSize) lblSize sliderSize: (CGSize) sldrSize boundsRect: (CGRect) b
        labelCGRect: (CGRect*) lblCGRect labelOrigin: (CGPoint) lblOrigin sliderOrigin: (CGPoint) sldrOrigin yIncrement: (int) yIncr {
    
    CGRect ret = CGRectZero;
    
    ret = CGRectMake(sldrOrigin.x,
                     sldrOrigin.y+yIncr,
                     sldrSize.width,
                     sldrSize.height
                     );
    *lblCGRect = CGRectMake(lblOrigin.x,
                            lblOrigin.y+yIncr,
                            lblSize.width,
                            lblSize.height
                            );
    return ret;
}

-(CGRect) labelSize: (CGSize) lblSize sliderSize: (CGSize) sldrSize boundsRect: (CGRect) b
labelCGRect: (CGRect*) lblCGRect yIncrement: (int) yIncr xIncrement: (int) xIncr {
    
    CGRect ret = CGRectZero;

        ret = CGRectMake(b.origin.x + (b.size.width - lblSize.width-sldrSize.width)/2 + lblSize.width + 5 + xIncr,
                         b.origin.y + (b.size.height - sldrSize.height)/2 + yIncr,
                         sldrSize.width,
                         sldrSize.height
                         );
        *lblCGRect = CGRectMake(b.origin.x + (b.size.width - lblSize.width-sldrSize.width)/2,
                               b.origin.y + (b.size.height - lblSize.height)/2 + 5 + yIncr,
                               lblSize.width,
                               lblSize.height
                               );
    return ret;
}


@end
