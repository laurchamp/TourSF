//
//  PlacesModel.h
//  Lab6
//
//  Created by Lauren Champeau on 4/8/17.
//  Copyright © 2017 Lauren Champeau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlacesModel : NSObject
// Public properties
@property (nonatomic, readonly) NSUInteger currentIndex;
+ (instancetype)sharedModel;
- (NSUInteger)numberOfPlaces;
- (NSDictionary *)placeAtIndex:(NSUInteger) index;
@end
