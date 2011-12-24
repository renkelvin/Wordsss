//
//  TodayVirtualActor.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Word.h"
#import "UserVirtualActor.h"

@interface TodayVirtualActor : NSObject
{
    // 
    Word* _wordPre;
    Word* _wordCur;
    Word* _wordPos;
    
    //
}

@property (nonatomic, retain) Word* wordPre;
@property (nonatomic, retain) Word* wordCur;
@property (nonatomic, retain) Word* wordPos;

#pragma mark - Class method

+ (TodayVirtualActor*)todayVirtualActor;

#pragma mark - Instance method

- (void)prepare;

- (void)updateWord;
- (void)updateWordWithWordId:(NSNumber*)word_id;

@end
