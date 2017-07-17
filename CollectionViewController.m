//
//  CollectionViewController.m
//  Lab6
//
//  Created by Lauren Champeau on 4/8/17.
//  Copyright © 2017 Lauren Champeau. All rights reserved.
//
#import "ViewController.h"
#import "CollectionViewController.h"
#import "PlacesModel.h"
#import "PlacesCollectionViewCell.h"
#import "PlaceDetailViewController.h"

@interface CollectionViewController ()
// Private property of model class
@property (strong, nonatomic) PlacesModel *placesModel;
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"collectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set up singleton for places model
    self.placesModel = [PlacesModel sharedModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Check the segue identifier is the same as the reuse identifier from storyboard (segueID)
    if ([segue.identifier  isEqual: @"segueID"]){
        // Get the index path from the collection view
        NSArray *indexPath = [self.collectionView indexPathsForSelectedItems];
        // set the destination of the segue to be the web view contorller
        PlaceDetailViewController *detailViewController = segue.destinationViewController;
        // Get the index of the current place object
        NSIndexPath *currPlaceIndex = [indexPath firstObject];
        // Set the place of the web view controller (detailViewController) to be the current place
        detailViewController.place = [self.placesModel placeAtIndex:currPlaceIndex.row];
    }
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.placesModel numberOfPlaces];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Cast the cell as a custom cell class (PlacesCollectionViewCell)
    PlacesCollectionViewCell *cell = (PlacesCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSDictionary *currPlace = [self.placesModel placeAtIndex:indexPath.row];
    // Call setUpCell method on the cell to set the label and image in each cell
    [cell setUpCell:currPlace];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

// Set up landscape horizontal scroll for rotations
#pragma mark - Rotation
- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) [self.collectionView collectionViewLayout];
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    // Change scroll directions
    if (orientation == UIInterfaceOrientationPortrait){
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    else{
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
}




































@end
