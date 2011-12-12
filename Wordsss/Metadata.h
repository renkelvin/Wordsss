//
//  Metadata.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Metadata : NSManagedObject

@property (nonatomic, retain) NSManagedObject *user;
@property (nonatomic, retain) NSSet *wordRecord;
@end

@interface Metadata (CoreDataGeneratedAccessors)

- (void)addWordRecordObject:(NSManagedObject *)value;
- (void)removeWordRecordObject:(NSManagedObject *)value;
- (void)addWordRecord:(NSSet *)values;
- (void)removeWordRecord:(NSSet *)values;

@end
