//
//  Word.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word_Association, Word_Dict, Word_List, Word_Rootaffix, Word_Sense;

@interface Word : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSMutableSet *word_association;
@property (nonatomic, retain) NSMutableSet *word_rootaffix;
@property (nonatomic, retain) NSMutableSet *word_sense;
@property (nonatomic, retain) Word_Dict *word_dict;
@property (nonatomic, retain) Word_List *word_list;
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

@end
