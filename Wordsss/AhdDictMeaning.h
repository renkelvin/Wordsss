//
//  AhdDictMeaning.h
//  Wordsss
//
//  Created by Ren Chuan on 12/31/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AhdDictSentence, AhdDictWord;

@interface AhdDictMeaning : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * meaning_cn;
@property (nonatomic, retain) NSString * meaning_en;
@property (nonatomic, retain) AhdDictSentence *ahdDictSentence;
@property (nonatomic, retain) AhdDictWord *ahdDictWord;

- (NSString*)getShortMeaning;
- (NSString*)getLongMeaning;

@end
