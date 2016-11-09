//
//  demo.h
//  HookDetector
//
//  Created by nexa on 06/11/2016.
//  Copyright © 2016 nexa. All rights reserved.
//

#ifndef demo_h
#define demo_h

// 1
@interface Target : NSObject

- (void)printAsString;

@end

@interface Hook : NSObject

- (void)printAsString;
- (void)newPrintAsString;

@end

// 2
@interface TargetEx : NSObject

+ (void) load;

- (id)init;
- (void)printAsString;

@end

@interface HookEx : NSObject

- (void)printAsString;

@end


#endif /* demo_h */
