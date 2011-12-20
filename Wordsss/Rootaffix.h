//
//  Rootaffix.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word_Rootaffix;

@interface Rootaffix : NSManagedObject

@property (nonatomic, retain) NSString * deformation;
@property (nonatomic, retain) NSString * description_cn;
@property (nonatomic, retain) NSString * description_en;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * meaning_cn;
@property (nonatomic, retain) NSString * meaning_en;
@property (nonatomic, retain) NSString * origin;
@property (nonatomic, retain) NSString * phrase;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSSet *word_rootaffix;
@end

@interface Rootaffix (CoreDataGeneratedAccessors)

- (void)addWord_rootaffixObject:(Word_Rootaffix *)value;
- (void)removeWord_rootaffixObject:(Word_Rootaffix *)value;
- (void)addWord_rootaffix:(NSSet *)values;
- (void)removeWord_rootaffix:(NSSet *)values;

@end
