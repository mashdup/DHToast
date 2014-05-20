//
//  ViewController.m
//  DHToast
//
//  Created by Dillon Hoa on 20/05/2014.
//  Copyright (c) 2014 8BitDog. All rights reserved.
//

#import "ViewController.h"
#import "DHToast.h"

@interface ViewController ()
@property (nonatomic, strong) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showToast:(id)sender{
    [_textField resignFirstResponder];
    [DHToast dismissAllOverlaysForView:self.view animated:YES];
    [DHToast showInView:self.view withMessage:_textField.text animated:YES];
}

- (IBAction)dismissToast:(id)sender {
    [DHToast dismissAllOverlaysForView:self.view animated:YES];
}

@end
