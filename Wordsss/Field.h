//
//  Field.h
//  Wordsss
//
//  Created by Kelvin Ren on 7/16/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word;

@interface Field : NSManagedObject

@property (nonatomic, retain) NSNumber * basic;
@property (nonatomic, retain) NSNumber * cet4;
@property (nonatomic, retain) NSNumber * cet6;
@property (nonatomic, retain) NSNumber * gre;
@property (nonatomic, retain) NSNumber * high;
@property (nonatomic, retain) NSNumber * holyshit;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * ielts;
@property (nonatomic, retain) NSNumber * middle;
@property (nonatomic, retain) NSNumber * sat;
@property (nonatomic, retain) NSNumber * tofel;
@property (nonatomic, retain) NSNumber * bec;
@property (nonatomic, retain) NSNumber * get;
@property (nonatomic, retain) NSNumber * tem4;
@property (nonatomic, retain) NSNumber * tem8;
@property (nonatomic, retain) NSNumber * gmat;
@property (nonatomic, retain) Word *word;

@end
