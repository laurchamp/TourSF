//
//  PlaceDetailViewController.h
//  Lab6
//
//  Created by Lauren Champeau on 4/9/17.
//  Copyright © 2017 Lauren Champeau. All rights reserved.
//

#import <UIKit/UIKit.h>

// Make the controller follow UIWebViewDelegate
@interface PlaceDetailViewController : UIViewController <UIWebViewDelegate>
// Public properties
@property (nonatomic, strong) NSDictionary *place;
@property (weak, nonatomic) IBOutlet UIWebView *placeWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end
