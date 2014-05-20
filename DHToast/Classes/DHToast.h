//
//  DHToast.h
//  8BitDog
//
//  Created by Dillon Hoa on 19/05/2014.
//
//
/*
 DHToast is a quick and simple UIView pop up with a message.
 The UILabel is a subview of contentView which is what is viewable when toast is popped
 Basic Usage
 #import "DHToast.h"
 then call [DHToast showInView:(UIView *)showingView withMessage:(NSString *)message animated:(BOOL)animated];
 to hide call [DHToast dismissAllOverlaysForView:(UIView *)view animated:(BOOL)animated];
 
 to edit style, change the definitions or override the contentView;
*/
//DHToast background colour
#define BACKGROUND_COLOUR       [UIColor colorWithRed:0. green:0. blue:0. alpha:.5]

//Message Label Definitiions
#define MESSAGE_TEXTCOLOUR      [UIColor whiteColor]
#define MESSAGE_TEXTFONT        [UIFont boldSystemFontOfSize:16.]
#define MESSAGE_TEXTALIGN       NSTextAlignmentCenter
#define MESSAGE_NUMBEROFLINES   0
#define MESSAGE_LINEBREAKMODE   NSLineBreakByWordWrapping

#define TOAST_BOTTOM_PADDING    150 //The height of the DHToast relative to the bottom
#define TOAST_HEIGHT            100 //Total height of the DHToast

#import <UIKit/UIKit.h>

@interface DHToast : UIView
//Basic Call with return self for the caller to retain if you need to change message or contentView later
+ (instancetype)showInView:(UIView *)showingView withMessage:(NSString *)message animated:(BOOL)animated;
+ (NSUInteger)dismissAllOverlaysForView:(UIView *)view animated:(BOOL)animated;

- (void)show:(BOOL)animated;                //Call to show DHToast, must add as subview to calling view
- (void)dismiss:(BOOL)animate;              //Dismiss DHToast, will remove from Superview automatically

- (void)setMessage:(NSString *)message;     //To change the message
- (void)setContentView:(UIView *)view;      //To override the contentView, this will resize the view to the contentView before replacing
@end
