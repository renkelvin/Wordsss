//
//  Word.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Association;

@interface Word : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *association;
@property (nonatomic, retain) NSSet *rootaffix;
@property (nonatomic, retain) NSSet *sense;
@property (nonatomic, retain) NSManagedObject *word_dict;
@property (nonatomic, retain) NSManagedObject *word_list;
@end

@interface Word (CoreDataGeneratedAccessors)

- (void)addAssociationObject:(Association *)value;
- (void)removeAssociationObject:(Association *)value;
- (void)addAssociation:(NSSet *)values;
- (void)removeAssociation:(NSSet *)values;

- (void)addRootaffixObject:(NSManagedObject *)value;
- (void)removeRootaffixObject:(NSManagedObject *)value;
- (void)addRootaffix:(NSSet *)values;
- (void)removeRootaffix:(NSSet *)values;

- (void)addSenseObject:(NSManagedObject *)value;
- (void)removeSenseObject:(NSManagedObject *)value;
- (void)addSense:(NSSet *)values;
- (void)removeSense:(NSSet *)values;

@end
