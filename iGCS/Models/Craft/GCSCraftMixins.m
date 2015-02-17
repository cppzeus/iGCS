//
//  GCSCraftMixins.m
//  iGCS
//
//  Created by Andrew Brown on 1/28/15.
//
//

#import "GCSCraftMixins.h"
#import "MavLinkUtility.h"
#import <objc/runtime.h>

@implementation GCSCraftMixins

-(void)updateWithHeartbeat:(mavlink_heartbeat_t) heartbeat {
    // this is needed because we expect the model state to have
    // already changed by the time NSNotifications are
    // dispatch so the model properties must be updated
    // before the notifications are sent out.
    mavlink_heartbeat_t lastHeartbeat = [(id)self heartbeat];
    [(id)self setHeartbeat:heartbeat];

    [GCSCraftNotifications didNavModeChangeFromLastHeartbeat:lastHeartbeat
                                             andNewHeartbeat:[(id)self heartbeat]];
}

- (NSString *) currentModeName {
    return [MavLinkUtility mavCustomModeToString:[(id)self heartbeat]];
}

@end