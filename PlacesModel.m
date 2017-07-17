//
//  PlacesModel.m
//  Lab6
//
//  Created by Lauren Champeau on 4/8/17.
//  Copyright © 2017 Lauren Champeau. All rights reserved.
//

#import "PlacesModel.h"
@interface PlacesModel()
// Private properties
@property (nonatomic, strong) NSArray *places;
@end


@implementation PlacesModel

// Shared Model singleton implementation
+ (instancetype) sharedModel{
    static PlacesModel *placesModel = nil;
    
    // GCD - Grand Central Dispatch
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        placesModel = [[PlacesModel alloc] init];
    });
    
    return placesModel;
}

// init method to read places information from plist
- (instancetype) init{
    self = [super init];
    if (self){
        // Load data from places.plist into an NSArray object
        NSString *path = [[NSBundle mainBundle] pathForResource:@"places" ofType:@"plist"];
        self.places = [NSArray arrayWithContentsOfFile:path];
    }
    return self;
}

// Get number of places in a method
- (NSUInteger)numberOfPlaces{
    return self.places.count;
}

// Get a place at a particular index in a method
- (NSDictionary *)placeAtIndex:(NSUInteger) index{
    return self.places[index];
}



@end
