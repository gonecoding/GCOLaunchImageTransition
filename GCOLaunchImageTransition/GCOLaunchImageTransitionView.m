//
//  GCOLaunchImageTransitionView.m
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

#import "GCOLaunchImageTransitionView.h"

@implementation GCOLaunchImageTransitionView

- (id)initWithAnimationDelay:(NSTimeInterval)delay animationDuration:(NSTimeInterval)duration animationOptions:(UIViewAnimationOptions)options
{
   self = [super initWithFrame:[[UIScreen mainScreen] bounds]];

   if( self )
   {
      self.image = [self launchImageForOrientation:[UIApplication sharedApplication].statusBarOrientation];

      self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
      
      // Start transition animation
      [UIView animateWithDuration:duration delay:delay options:options animations:^
       {
          self.alpha = 0.0;
       } completion:
       ^( BOOL finished )
       {
          [self removeFromSuperview];
       }];
   }
   
   return self;
}

- (void)layoutSubviews
{
   [super layoutSubviews];
   
   UIInterfaceOrientation statusBarOrientation = [UIApplication sharedApplication].statusBarOrientation;
   
   if( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone )
   {
      CGRect screenBounds = [[UIScreen mainScreen] bounds];
      CGSize statusBarSize = [UIApplication sharedApplication].statusBarFrame.size;
      
      if( UIInterfaceOrientationIsLandscape( statusBarOrientation ) )
      {
         if( statusBarOrientation == UIInterfaceOrientationLandscapeLeft )
         {
            self.transform = CGAffineTransformMakeRotation( M_PI_2 );
            self.frame = CGRectMake( 0.0, -statusBarSize.width, screenBounds.size.height, screenBounds.size.width );
         }
         else
         {
            self.transform = CGAffineTransformMakeRotation( -M_PI_2 );
            self.frame = CGRectMake( 0.0, -statusBarSize.width, screenBounds.size.height, screenBounds.size.width );
         }
      }
      else
      {
         self.transform = CGAffineTransformIdentity;
         self.frame = CGRectMake( 0.0, -statusBarSize.height, screenBounds.size.width, screenBounds.size.height );
      }
   }
}

- (UIImage*)launchImageForOrientation:(UIInterfaceOrientation)orientation
{
   UIImage* launchImage = nil;
   
   if( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone )
   {
      // Use Retina 4 launch image
      if( [UIScreen mainScreen].bounds.size.height == 568.0 )
      {
         launchImage = [UIImage imageNamed:@"Default-568h@2x.png"];
      }
      // Use Retina 3.5 launch image
      else
      {
         launchImage = [UIImage imageNamed:@"Default.png"];
      }
   }
   else if( [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad )
   {
      // Start with images for special orientations
      if( orientation == UIInterfaceOrientationPortraitUpsideDown )
      {
         launchImage = [UIImage imageNamed:@"Default-PortraitUpsideDown.png"];
      }
      else if( orientation == UIInterfaceOrientationLandscapeLeft )
      {
         launchImage = [UIImage imageNamed:@"Default-LandscapeLeft.png"];
      }
      else if( orientation == UIInterfaceOrientationLandscapeRight )
      {
         launchImage = [UIImage imageNamed:@"Default-LandscapeRight.png"];
      }
      
      // Use iPad default launch images if nothing found yet
      if( launchImage == nil )
      {
         if( UIInterfaceOrientationIsPortrait( orientation ) )
         {
            launchImage = [UIImage imageNamed:@"Default-Portrait.png"];
         }
         else
         {
            launchImage = [UIImage imageNamed:@"Default-Landscape.png"];
         }
      }
      
      // No launch image found so far, fall back to default
      if( launchImage == nil )
      {
         launchImage = [UIImage imageNamed:@"Default.png"];
      }
   }
   
   // As a last resort try to read the launch image from the app's Info.plist
   if( launchImage == nil )
   {
      NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
      NSString* launchImageName = [infoDict valueForKey:@"UILaunchImageFile"];
      
      launchImage = [UIImage imageNamed:launchImageName];
   }
   
   return launchImage;
}

@end
