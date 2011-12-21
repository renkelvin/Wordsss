//
//  Association.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word_Association;

@interface Association : NSManagedObject

@property (nonatomic, retain) NSString * description_cn;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSMutableSet *word_association;
@end

@interface Association (CoreDataGeneratedAccessors)

- (void)addWord_associationObject:(Word_Association *)value;
- (void)removeWord_associationObject:(Word_Association *)value;
- (void)addWord_association:(NSSet *)values;
- (void)removeWord_association:(NSSet *)values;

@end
