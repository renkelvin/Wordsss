//
//  Word.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/20/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Association, Rootaffix, Sense, Word_Dict, Word_List;

@interface Word : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *association;
@property (nonatomic, retain) NSSet *rootaffix;
@property (nonatomic, retain) NSSet *sense;
@property (nonatomic, retain) Word_Dict *word_dict;
@property (nonatomic, retain) Word_List *word_list;
@end

@interface Word (CoreDataGeneratedAccessors)

- (void)addAssociationObject:(Association *)value;
- (void)removeAssociationObject:(Association *)value;
- (void)addAssociation:(NSSet *)values;
- (void)removeAssociation:(NSSet *)values;

- (void)addRootaffixObject:(Rootaffix *)value;
- (void)removeRootaffixObject:(Rootaffix *)value;
- (void)addRootaffix:(NSSet *)values;
- (void)removeRootaffix:(NSSet *)values;

- (void)addSenseObject:(Sense *)value;
- (void)removeSenseObject:(Sense *)value;
- (void)addSense:(NSSet *)values;
- (void)removeSense:(NSSet *)values;

+ (Word*)wordWithWordId:(NSNumber*)wordId inManagedObjectContext:(NSManagedObjectContext *)context;

@end
