//
//  View.h
//  MyTextField
//
//  Created by Mike Smith on 3/18/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View : UIView <UITextFieldDelegate> {
    UITextField *textField;
    UILabel *label;
}

@end
