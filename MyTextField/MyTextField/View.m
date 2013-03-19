//
//  View.m
//  MyTextField
//
//  Created by Mike Smith on 3/18/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        UIFont *font = [UIFont systemFontOfSize:24];
        CGFloat height = [@"A" sizeWithFont:font].height;
        
        CGRect b = self.bounds;
        CGRect f = CGRectMake(
            b.origin.x,
            b.origin.y,
            b.size.width,
            height);
        textField = [[UITextField alloc] initWithFrame:f];
        textField.borderStyle = UITextBorderStyleNone;
        textField.backgroundColor = [UIColor yellowColor];
        textField.textColor = [UIColor blackColor];
        textField.clearButtonMode=UITextFieldViewModeAlways;
        textField.returnKeyType = UIReturnKeyDone;
        textField.font=font;
        textField.placeholder=@"<type a word>";
        textField.textAlignment=UITextAlignmentLeft;
        textField.autocapitalizationType=UITextAutocorrectionTypeNo;
        textField.secureTextEntry=NO;
        textField.delegate=self;
        [self addSubview:textField];
        f=CGRectMake(
                     b.origin.x,
                     b.origin.y+textField.bounds.size.height+10,
                     b.size.width,
                     height);

        label=[[UILabel alloc] initWithFrame:f];
        label.backgroundColor=[UIColor orangeColor];
        label.font=font;
        [self addSubview:label];
    }
    return self;
}

#pragma mark -
#pragma mark methods of UITextFieldDelegate protocol

-(BOOL) textFieldShouldReturn: (UITextField *) tf {
    if ([tf.text isEqualToString:@""]) {
        textField.placeholder=@"<type a nonempty word>";
    }else {
        [tf resignFirstResponder];
    }
    return YES;
}

-(void) textFieldDidEndEditing:(UITextField *)tf {
    if ([textField.text isEqualToString:@""]){
        label.text = @"";
    }else {
        NSString *lowercase = [textField.text lowercaseString];
        label.text = [NSString stringWithFormat:@"%@%@ay",
                      [lowercase substringFromIndex:1],
                      [lowercase substringFromIndex:1]
                      ];
    }
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
