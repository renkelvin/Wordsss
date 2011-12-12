//
//  TodayVirtualActor.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "TodayVirtualActor.h"

static TodayVirtualActor* sharedTodayVirtualActor = nil;

@implementation TodayVirtualActor

@synthesize wordPre = _wordPre, wordCur = _wordCur, wordPos = _wordPos;

#pragma mark -

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark -

+ (TodayVirtualActor*)todayVirtualActor
{
    if (!sharedTodayVirtualActor) {
        sharedTodayVirtualActor = [[TodayVirtualActor alloc] init];
    }
    
    return sharedTodayVirtualActor;
}

#pragma mark - 

- (void)updateWordWithWordId:(NSNumber*)word_id
{
    
}

@end
