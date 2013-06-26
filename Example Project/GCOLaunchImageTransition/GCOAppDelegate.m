//
//  GCOAppDelegate.m
//  GCOLaunchImageTransition
//
//  Copyright (c) 2013, Michael Sedlaczek, Gone Coding, http://gonecoding.com
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//    * Redistributions of source code must retain the above copyright
//      notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright
//      notice, this list of conditions and the following disclaimer in the
//      documentation and/or other materials provided with the distribution.
//    * Neither the name of Michael Sedlaczek and/or Gone Coding nor the
//      names of its contributors may be used to endorse or promote products
//      derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY Michael Sedlaczek ''AS IS'' AND ANY
//  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL Michael Sedlaczek BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "GCOAppDelegate.h"

#import "GCOLaunchImageTransition.h"

@interface GCOAppDelegate ()

@property (nonatomic, assign) float progress;

@end


@implementation GCOAppDelegate

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   // Choose a demo by setting values from 1 to 3
   NSUInteger demo = 4;
   
   switch( demo )
   {
      default:
      case 1:
      {
         // Create transition with a given style that begins immediately
         [GCOLaunchImageTransition transitionWithDuration:0.5 style:GCOLaunchImageTransitionAnimationStyleZoomIn];

         break;
      }
      case 2:
      {
         // Create transition with an near-infinite delay that requires manual dismissal via notification
         [GCOLaunchImageTransition transitionWithInfiniteDelayAndDuration:0.5 style:GCOLaunchImageTransitionAnimationStyleFade];
         
         // Dissmiss the launch image transition by posting a notification after a few seconds
         [self performSelector:@selector(finishLaunchImageTransitionNow) withObject:nil afterDelay:3.0];

         break;
      }
         
      case 3:
      {
         // Create fully customizable transition including an optional activity indicator
         // The 'activityIndicatorPosition' is a percentage value ('CGPointMake( 0.5, 0.5 )' being the center)
         // See https://github.com/gonecoding/GCOLaunchImageTransition for more documentation
         
         [GCOLaunchImageTransition transitionWithDelay:5.0 duration:0.5 style:GCOLaunchImageTransitionAnimationStyleZoomOut activityIndicatorPosition:CGPointMake( 0.5, 0.9 ) activityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];

         break;
      }

      case 4:
      {
          GCOLaunchImageTransition *transition = [GCOLaunchImageTransition transitionWithInfiniteDelayAndDuration:0.5 style:GCOLaunchImageTransitionAnimationStyleZoomIn progressBarPosition:CGPointMake( 0.5, 0.9 ) progressBarWidth:0.5];
          transition.progressLabel.font = [UIFont boldSystemFontOfSize:16];
          transition.progressLabel.textColor = [UIColor purpleColor];
          transition.progressView.trackTintColor = [UIColor lightGrayColor];
          transition.progressView.progressTintColor = [UIColor purpleColor];

          self.progress = 0.0;
          NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateLaunchProgress:) userInfo:nil repeats:YES];
          [timer fire];

          [self performSelector:@selector(finishLaunchImageTransitionNow) withObject:nil afterDelay:6.0];
          break;
      }
   }
}


- (void)updateLaunchProgress:(NSTimer *)timer
{
    NSDictionary *userInfo = @{GCOLaunchImageTransitionProgressValue : @(self.progress), GCOLaunchImageTransitionProgressText:[NSString stringWithFormat:@"%u %%", (int)(self.progress * 100)]};
    [[NSNotificationCenter defaultCenter] postNotificationName:GCOLaunchImageTransitionProgressNotification object:nil userInfo:userInfo];

    if (self.progress >= 1.0f)
    {
        [timer invalidate];
    }

    self.progress += 0.002f;
}


- (void)finishLaunchImageTransitionNow
{
   [[NSNotificationCenter defaultCenter] postNotificationName:GCOLaunchImageTransitionHideNotification object:self];
}

@end
