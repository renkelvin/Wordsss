//
//  UserDataManager.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-2.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Word.h"
#import "User.h"
#import "Defult.h"
#import "Status.h"
#import "Profile.h"
#import "HisData.h"
#import "HisRecord.h"
#import "StaRecord.h"
#import "WordRecord.h"
#import "SearchHis.h"

@interface UserDataManager : NSObject 

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (UserDataManager*)userdataManager;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (User*)createUser;
- (User*)createUser:(NSDictionary*)dict;

- (StaRecord*)createStaRecord:(User*)user;
- (HisRecord*)createHisRecord:(WordRecord*)wordRecord forUser:(User*)user;
- (WordRecord*)createWordRecord:(Word*)word forUser:(User*)user;
- (SearchHis*)createSearchHis:(Word*)word forUser:(User*)user;

- (NSArray*)getSearchHis;

- (void)resetAll;

@end
