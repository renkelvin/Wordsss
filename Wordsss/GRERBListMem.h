//
//  GRERBListMem.h
//  Wordsss
//
//  Created by Ren Chuan on 2/25/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GRERBListWord;

@interface GRERBListMem : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSString * description_cn;
@property (nonatomic, retain) GRERBListWord *grerbListWord;

@end
