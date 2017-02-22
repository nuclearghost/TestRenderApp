//
//  STRAdView.h
//  SharethroughSDK
//
//  Created by sharethrough on 1/16/14.
//  Copyright (c) 2014 Sharethrough. All rights reserved.
//

/**
 The STRAdView protocol is what your custom ad views are required to adhere to before an ad can be placed onto it. These getter methods may be fulfilled directly through properties that you could link from Interface Builder views, or you can simply define the getters. 
 
 If you have a content view that already has places for a title, description, etc. then you can subclass that view and have the subclass define the methods of the protocol, simply returning the correct view that matches the following getters.
 */
#import <Foundation/Foundation.h>

@protocol STRAdView <NSObject>

/**
 This method should return a UILabel (or subclass) that is appropriate for setting the ad title on.
 */
- (UILabel *)adTitle;

/**
 This method should return a UIImage (or subclass) that is appropriate for setting the ad thumbnail.
 */
- (UIImageView *)adThumbnail;

/**
 This method should return a UILabel (or subclass) that is appropriate for setting the string "Promoted by <brand name>".
 */
- (UILabel *)adSponsoredBy;

/**
 This method should return a UIButton of type UIButtonTypeDetailDisclosure for getting privacy information including ad tracking opt out info.
 */
- (UIButton *)disclosureButton;


@optional

/**
 This optional method should return a UILabel (or subclass) that is appropriate for setting the ad description on. You may choose not to display the ad description.
 */
- (UILabel *)adDescription;

/**
 This optional method should return a 16x16 imageView to place the brand logo of the advertiser. You may choose not to display the brand logo and will only appear on ads where it is supplied by the advertiser.
 */
- (UIImageView *)adBrandLogo;

/**
 This optional method should return a UIGestureRecognizer that will be used to trigger and ad interaction event. If method is not implemented, then UITapGestureRecognizer will be used by default
 */
- (UIGestureRecognizer *)adInteractGestureRecognizer;


/*
 This method should return an NSUInteger that specifies the width of the thumbnail in pixels. It is used to fetch the thumbnail image in the exact size of the thumbnail view.
 */
- (NSUInteger)thumbnailWidth;

/*
 This method should return an NSUInteger that specifies the height of the thumbnail in pixels.  It is used to fetch the thumbnail image in the exact size of the thumbnail view.
 */
- (NSUInteger)thumbnailHeight;

@end
