//
//  Word_Dict.h
//  Wordsss
//
//  Created by Ren Chuan on 12/26/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class McecDictWord, MwcDictWord, Word;

@interface Word_Dict : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSMutableSet *mwcDictWord;
@property (nonatomic, retain) Word *word;
@property (nonatomic, retain) NSMutableSet *ahdDictWord;
@end

@interface Word_Dict (CoreDataGeneratedAccessors)

- (void)addMcecDictWordObject:(McecDictWord *)value;
- (void)removeMcecDictWordObject:(McecDictWord *)value;
- (void)addMcecDictWord:(NSSet *)values;
- (void)removeMcecDictWord:(NSSet *)values;

- (void)addMwcDictWordObject:(MwcDictWord *)value;
- (void)removeMwcDictWordObject:(MwcDictWord *)value;
- (void)addMwcDictWord:(NSSet *)values;
- (void)removeMwcDictWord:(NSSet *)values;

- (void)addAhdDictWordObject:(NSManagedObject *)value;
- (void)removeAhdDictWordObject:(NSManagedObject *)value;
- (void)addAhdDictWord:(NSSet *)values;
- (void)removeAhdDictWord:(NSSet *)values;

+ (Word_Dict *)entityWithId:(NSNumber *)entityId inManagedObjectContext:(NSManagedObjectContext *)context;

@end
