//
//  WordsssDBDataManager.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Word.h"
#import "Association.h"
#import "Rootaffix.h"
#import "Sense.h"
#import "List.h"

@interface WordsssDBDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (WordsssDBDataManager*)wordsssDBDataManager;

- (void)saveContext;

- (NSURL *)applicationDocumentsDirectory;

#pragma mark -

- (NSArray*)getAllWord;
- (NSArray*)getAllPureWord;

- (Word*)getWordWithId:(NSNumber*)wordId;
- (Word*)getWordWithName:(NSString*)wordName;

- (NSArray*)getWordsWithIds:(NSArray*)idArray;
- (NSArray*)getWordsWithPrefix:(NSString*)prefix;

- (NSArray*)getRandomAssociations:(int)count;
- (NSArray*)getRandomRootaffixs:(int)count;
- (NSArray*)getRandomSenses:(int)count;
- (NSArray*)getListWordArray:(List*)list;

- (NSArray*)getTBBTListSentenceArrayWithSeason:(NSNumber*)season episode:(NSNumber*)episode;

@end
