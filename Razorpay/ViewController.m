//
//  ViewController.m
//  Razorpay
//
//  Created by Bhishak Sanyal on 10/18/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "ViewController.h"
#import <Razorpay/Razorpay.h>

@interface ViewController () <RazorpayPaymentCompletionProtocol> {
    Razorpay *razorpay;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    razorpay = [Razorpay initWithKey:@"rzp_test_F9O5IVX0kTkoMT" andDelegate:self];
}

- (void)showPaymentForm { // called by your app
    NSDictionary *options = @{
                              @"amount": @"1000", // mandatory, in paise
                              // all optional other than amount.
                              @"image": @"https://url-to-image.png",
                              @"name": @"business or product name",
                              @"description": @"purchase description",
                              @"prefill" : @{
                                      @"email": @"pranav@razorpay.com",
                                      @"contact": @"8879524924"
                                      },
                              @"theme": @{
                                      @"color": @"#2F3B63"
                                      }
                              };
    [razorpay open:options];
}

- (IBAction)btnAction:(id)sender {
    [self showPaymentForm];
}


#pragma mark - RazorpayPaymentCompletionProtocol -

- (void)onPaymentSuccess:(nonnull NSString *)payment_id {
    NSLog(@"%@",payment_id);
}

- (void)onPaymentError:(int)code description:(nonnull NSString *)str {
    NSLog(@"%@",str);
}

@end
