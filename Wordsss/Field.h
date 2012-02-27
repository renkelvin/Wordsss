//
//  Field.h
//  Wordsss
//
//  Created by Ren Chuan on 2/28/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word;

@interface Field : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * basic;
@property (nonatomic, retain) NSNumber * middle;
@property (nonatomic, retain) NSNumber * high;
@property (nonatomic, retain) NSNumber * cet4;
@property (nonatomic, retain) NSNumber * cet6;
@property (nonatomic, retain) NSNumber * ielts;
@property (nonatomic, retain) NSNumber * tofel;
@property (nonatomic, retain) NSNumber * sat;
@property (nonatomic, retain) NSNumber * gre;
@property (nonatomic, retain) NSNumber * holyshit;
@property (nonatomic, retain) Word *word;

@end
