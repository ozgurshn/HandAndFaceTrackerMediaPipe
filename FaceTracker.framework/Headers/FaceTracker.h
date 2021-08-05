//
//  FaceDetectionViewController.h
//  Mediapipe
//
//  Created by ozgur on 7/8/21.
//
//#import <UIKit/UIKit.h>

//#import "mediapipe/examples/ios/common/CommonViewController.h"

#import <Foundation/Foundation.h>
#import <CoreVideo/CoreVideo.h>

@class FaceTracker;

@protocol FaceTrackerDelegate <NSObject>
- (void)faceTracker: (FaceTracker*)faceTracker didOutputLandmarks: (NSArray*)faceArray;
- (void)faceTracker: (FaceTracker*)faceTracker didOutputPixelBuffer: (CVPixelBufferRef)pixelBuffer;


@end


@interface FaceTracker : NSObject
- (instancetype)init;
- (void)startGraph;
- (void)processVideoFrame:(CVPixelBufferRef)imageBuffer;
@property (weak, nonatomic) id <FaceTrackerDelegate> delegate;
@end
