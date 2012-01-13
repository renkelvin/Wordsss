//
//  Word.h
//  Wordsss
//
//  Created by Ren Chuan on 12/28/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "WordCellLabel.h"

#import "Frequency.h"

#import "Word_Association.h"
#import "Word_Dict.h"
#import "Word_List.h"
#import "Word_Relation.h"
#import "Word_Rootaffix.h"
#import "Word_Sense.h"

#import "AhdDictWord.h"

@class Frequency, Word_Association, Word_Dict, Word_List, Word_Relation, Word_Rootaffix, Word_Sense;

@interface Word : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Frequency *frequency;
@property (nonatomic, retain) NSMutableSet *word_association;
@property (nonatomic, retain) Word_Dict *word_dict;
@property (nonatomic, retain) Word_List *word_list;
@property (nonatomic, retain) Word_Relation *word_relation;
@property (nonatomic, retain) NSMutableSet *word_rootaffix;
@property (nonatomic, retain) NSMutableSet *word_sense;
@end

@interface Word (CoreDataGeneratedAccessors)

- (void)addWord_associationObject:(Word_Association *)value;
- (void)removeWord_associationObject:(Word_Association *)value;
- (void)addWord_association:(NSSet *)values;
- (void)removeWord_association:(NSSet *)values;

- (void)addWord_rootaffixObject:(Word_Rootaffix *)value;
- (void)removeWord_rootaffixObject:(Word_Rootaffix *)value;
- (void)addWord_rootaffix:(NSSet *)values;
- (void)removeWord_rootaffix:(NSSet *)values;

- (void)addWord_senseObject:(Word_Sense *)value;
- (void)removeWord_senseObject:(Word_Sense *)value;
- (void)addWord_sense:(NSSet *)values;
- (void)removeWord_sense:(NSSet *)values;

+ (Word *)wordWithId:(NSNumber *)wordId inManagedObjectContext:(NSManagedObjectContext *)context;

- (Word*)getTargetWord;

- (void)configLabel:(WordCellLabel*)label;

- (NSString*)getBriefMeaning;
- (NSString*)getSummaryMeaning;

@end
