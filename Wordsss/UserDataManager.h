//
//  UserDataManager.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-2.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDataManager : NSObject {

}

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (UserDataManager*)userdataManager;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
