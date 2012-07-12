//
//  TBBTListTLViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBBTListTLViewController : UIViewController
{
    NSNumber* _seasonNum;
    NSNumber* _episodeNum;
    
    NSArray* _listSentenceArray;
}

#pragma mark - Instance method

- (TBBTListTLViewController*)initWithListSentenceArray:listSentenceArray seasonNum:seasonNum episodeNum:episodeNum;

@end
