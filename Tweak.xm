#import <UIKit/UIKit.h>

@interface UIViewController (Private)
@property(nonatomic, getter=isModalInPresentation) BOOL modalInPresentation;
@end

@interface UIImageView (Private)
@end

@interface UIView (Private)
@end

%group main
%hook UIViewController
- (void)setModalPresentationStyle:(UIModalPresentationStyle)arg1 {
    if ([NSStringFromClass([((UIViewController *)self) class])isEqualToString:@"MusicApplication.NowPlayingViewController"] || [NSStringFromClass([((UIViewController *)self) class])isEqualToString:@"Music.NowPlayingViewController"]) {
        self.modalInPresentation = NO;
        arg1 = UIModalPresentationCustom;
        
        UISwipeGestureRecognizer *gestureRecognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerDown:)];
        [gestureRecognizerDown setDirection:(UISwipeGestureRecognizerDirectionDown)];
        [self.view addGestureRecognizer:gestureRecognizerDown];
    }
    %orig;
}

%new
-(void)swipeHandlerDown:(id)sender {
    if ([NSStringFromClass([((UIViewController *)self) class])isEqualToString:@"MusicApplication.NowPlayingViewController"] || [NSStringFromClass([((UIViewController *)self) class])isEqualToString:@"Music.NowPlayingViewController"]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

%end

%hook UIView
- (void)willMoveToWindow:(id)arg1 {
    if ([NSStringFromClass([((UIView *)self) class])isEqualToString:@"MusicApplication.NowPlayingContentView"] || [NSStringFromClass([((UIView *)self) class])isEqualToString:@"Music.NowPlayingContentView"]) {
        %orig;
        self.autoresizingMask = nil;
    }
    %orig;
}

- (void)setFrame:(CGRect)arg1 {
    if ([NSStringFromClass([((UIView *)self) class])isEqualToString:@"MusicApplication.NowPlayingContentView"] || [NSStringFromClass([((UIView *)self) class])isEqualToString:@"Music.NowPlayingContentView"]) {
        %orig;
        if (self.frame.size.width>100) {
        arg1 = CGRectMake(self.frame.origin.x, self.frame.origin.y+44, self.frame.size.width, self.frame.size.height);
        }
        %orig;
    }
    %orig;
}

%end
%end

%ctor {
%init(main);
}
