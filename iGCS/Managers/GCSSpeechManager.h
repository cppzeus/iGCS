//
//  GCSSpeechManager.h
//  iGCS
//
//  Created by Andrew Brown on 1/12/15.
//
//

#import <Foundation/Foundation.h>

@interface GCSSpeechManager : NSObject
+ (instancetype) sharedInstance;
- (void)flyToPosition;
@end
