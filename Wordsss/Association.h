//
//  Association.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Association : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSString * description_cn;
@property (nonatomic, retain) NSSet *word;
@end

@interface Association (CoreDataGeneratedAccessors)

- (void)addWordObject:(NSManagedObject *)value;
- (void)removeWordObject:(NSManagedObject *)value;
- (void)addWord:(NSSet *)values;
- (void)removeWord:(NSSet *)values;

@end
