#import <UIKit/UIKit.h>

@interface otherPlayingController:UIViewController
@end

@interface MusicLyricsBackgroundView : UIView
@end

@interface UIViewController (Private)
@property(nonatomic, readwrite) BOOL
IsModalInPresentation;
@end

MusicLyricsBackgroundView* lyricView;
UIView* viewIWant;
otherPlayingController* dismissDis;