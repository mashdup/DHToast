//
//  DHToast.m
//  8BitDog
//
//  Created by Dillon Hoa on 19/05/2014.
//
//

#import "DHToast.h"


@interface DHToast ()
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, retain) UIView *contentView;
@end

@implementation DHToast

#pragma mark - Class Methods

+ (instancetype)showInView:(UIView *)showingView withMessage:(NSString *)message animated:(BOOL)animated{
    DHToast *toast = [self new];
    if (message)
        toast.messageLabel.text = message;
    [showingView addSubview:toast];
    [toast show:animated];
    return toast;

}


+ (NSUInteger)dismissAllOverlaysForView:(UIView *)view animated:(BOOL)animated {
    NSArray *views = [self allOverlaysForView:view];
    for (DHToast *toastView in views) {
        [toastView dismiss:animated];
        return YES;
    }
    return views.count;
}

+ (NSArray *)allOverlaysForView:(UIView *)view {
    NSMutableArray *overlays = [NSMutableArray new];
    NSArray *subviews = view.subviews;
    for (UIView *view in subviews) {
        if ([view isKindOfClass:self]) {
            [overlays addObject:view];
        }
    }
    return overlays;
}

#pragma mark - DHToast instance methods

- (void)show:(BOOL)animated {
    CGRect parentFrame = self.superview.bounds;
    CGRect frame = CGRectMake(parentFrame.size.width/2, parentFrame.size.height +parentFrame.origin.y - TOAST_BOTTOM_PADDING, parentFrame.size.width, TOAST_HEIGHT);
    self.frame = frame;
    [self layoutViews];
    if (animated){
        CGRect frame2 = frame;frame2.origin.x =parentFrame.size.width;
        self.frame = frame2;
        [UIView animateWithDuration:.4 delay:.0 usingSpringWithDamping:.5 initialSpringVelocity:.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.frame = frame;
        } completion:^(BOOL finished) {
            
        }];
        
    }
}

- (void)dismiss:(BOOL)animated {
    if (animated){
        CGRect parentFrame = self.superview.bounds;
        CGRect frame = self.frame;
        frame.origin.x = parentFrame.size.width;
        [UIView animateWithDuration:.4 delay:.0 usingSpringWithDamping:.5 initialSpringVelocity:.8 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.frame = frame;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
        
    } else {
        [self removeFromSuperview];
    }
    
}

- (void)layoutViews{
    _contentView.frame = CGRectMake(0, 0, self.frame.size.width/2, TOAST_HEIGHT);
    _messageLabel.frame = CGRectMake(5, 5, self.frame.size.width/2 -10, 90);
}

#pragma mark - override methods

- (void)setMessage:(NSString *)message {
    _messageLabel.text = message;
}
- (void)setContentView:(UIView *)view {
    view.frame =_contentView.frame;
    _contentView = view;
}

#pragma mark init methods
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.backgroundColor = BACKGROUND_COLOUR;
    
    _messageLabel = [UILabel new];
    _messageLabel.textColor = MESSAGE_TEXTCOLOUR;
    _messageLabel.textAlignment = MESSAGE_TEXTALIGN;
    _messageLabel.font = MESSAGE_TEXTFONT;
    _messageLabel.numberOfLines = MESSAGE_NUMBEROFLINES;
    _messageLabel.lineBreakMode = MESSAGE_LINEBREAKMODE;
    
    _contentView = [UIView new];
    [_contentView addSubview:_messageLabel];
    [self addSubview:_contentView];
    
}
@end
