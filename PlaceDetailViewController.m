//
//  PlaceDetailViewController.m
//  Lab6
//
//  Created by Lauren Champeau on 4/9/17.
//  Copyright © 2017 Lauren Champeau. All rights reserved.
//

#import "PlaceDetailViewController.h"

@interface PlaceDetailViewController ()

@end

@implementation PlaceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set navigationItem to the place name for each website
    self.navigationItem.title = [self.place objectForKey:@"name"];
    // Do any additional setup after loading the view.
    
    // Get the url from the current place and then load the website
    NSString *strForURL = [self.place objectForKey:@"website"];
    NSURL *url = [[NSURL alloc] initWithString:strForURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.placeWebView loadRequest:request];
}

// Start activity indicator spinning
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.spinner startAnimating];
}

// Stop activity indicator spinning
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.spinner stopAnimating];
}

// Stop activity indicator spinning
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.spinner stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
