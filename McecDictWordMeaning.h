//
//  McecDictWordMeaning.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface McecDictWordMeaning : NSManagedObject

@property (nonatomic, retain) NSString * meaning_cn;
@property (nonatomic, retain) NSManagedObject *mcecDictWord;

@end
