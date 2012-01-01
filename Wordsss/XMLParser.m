//
//  XMLParser.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/6/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "XMLParser.h"

static XMLParser* sharedXMLParser;

static enum IterStat_M ism = MNONE;
static enum IterStat_D isd = DNONE;
static enum IterStat_T ist = TNONE;
static enum IterStat_R isr = RNONE;
static enum IterStat_F isf = FNONE;

NSManagedObject* object = nil;

static NSDictionary* attrDict = nil;
static NSString* attrString = nil;

NSMutableDictionary* wordDICT = nil;                //TTABLEDATA_WORD
NSMutableDictionary* frequencyDICT = nil;           //TTABLEDATA_FREQUENCY

NSMutableDictionary* wordAssociationDICT = nil;     //TTABLEDATA_WORDASSOCIATION
NSMutableDictionary* associationDICT = nil;         //TTABLEDATA_ASSOCIATION
NSMutableDictionary* wordRootaffixDICT = nil;       //TTABLEDATA_WORDROOTAFFIX
NSMutableDictionary* rootaffixDICT = nil;           //TTABLEDATA_ROOTAFFIX  
NSMutableDictionary* wordSenseDICT = nil;           //TTABLEDATA_WORDSENSE
NSMutableDictionary* senseDICT = nil;               //TTABLEDATA_SENSE
NSMutableDictionary* senseFamilyDICT = nil;         //TTABLEDATA_SENSEFAMILY

NSMutableDictionary* wordDictDICT = nil;            //TTABLEDATA_WORDDICT

NSMutableDictionary* mcecDictWordDICT = nil;        //TTABLEDATA_MCECDICTWORD
NSMutableDictionary* mcecDictMeaningDICT = nil;     //TTABLEDATA_MCECDICTMEANING
NSMutableDictionary* ahdDictWordDICT = nil;         //TTABLEDATA_AHDDICTWORD
NSMutableDictionary* ahdDictMeaningDICT = nil;      //TTABLEDATA_AHDDICTMEANING
NSMutableDictionary* ahdDictSentenceDICT = nil;     //TTABLEDATA_AHDDICTSENTENCE
NSMutableDictionary* mwcDictWordDICT = nil;         //TTABLEDATA_MWCDICTWORD
NSMutableDictionary* mwcDictMeaningDICT = nil;      //TTABLEDATA_MWCDICTMEANING

@implementation XMLParser

#pragma mark -

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark -

// get xmlParser
+ (XMLParser*)xmlParser
{
    if (!sharedXMLParser) {
        sharedXMLParser = [[XMLParser alloc] init];
    }
    
    return sharedXMLParser;
}

#pragma mark -

- (void)createXmlParser
{
    NSString* pathRes = [[NSBundle mainBundle] pathForResource:@"WordsssDB" ofType:@"xml"];
    NSURL* pathUrl = [NSURL fileURLWithPath:pathRes];
    
    _parser = [[NSXMLParser alloc] initWithContentsOfURL:pathUrl];
    
    [_parser setDelegate:self];
}

#pragma mark -

- (void)initDicts
{
    wordDICT = [NSMutableDictionary dictionary];                //TTABLEDATA_WORD
    frequencyDICT = [NSMutableDictionary dictionary];           //TTABLEDATA_FREQUENCY
    wordAssociationDICT = [NSMutableDictionary dictionary];     //TTABLEDATA_WORDASSOCIATION
    associationDICT = [NSMutableDictionary dictionary];         //TTABLEDATA_ASSOCIATION
    wordRootaffixDICT = [NSMutableDictionary dictionary];       //TTABLEDATA_WORDROOTAFFIX
    rootaffixDICT = [NSMutableDictionary dictionary];           //TTABLEDATA_ROOTAFFIX  
    wordSenseDICT = [NSMutableDictionary dictionary];           //TTABLEDATA_WORDSENSE
    senseDICT = [NSMutableDictionary dictionary];               //TTABLEDATA_SENSE
    senseFamilyDICT = [NSMutableDictionary dictionary];         //TTABLEDATA_SENSEFAMILY
    wordDictDICT = [NSMutableDictionary dictionary];            //TTABLEDATA_WORDDICT
    mcecDictWordDICT = [NSMutableDictionary dictionary];        //TTABLEDATA_MCECDICTWORD
    mcecDictMeaningDICT = [NSMutableDictionary dictionary];     //TTABLEDATA_MCECDICTMEANING
    mwcDictWordDICT = [NSMutableDictionary dictionary];         //TTABLEDATA_MWCDICTWORD
    mwcDictMeaningDICT = [NSMutableDictionary dictionary];      //TTABLEDATA_MWCDICTMEANING
    ahdDictWordDICT = [NSMutableDictionary dictionary];         //TTABLEDATA_AHDDICTWORD
    ahdDictMeaningDICT = [NSMutableDictionary dictionary];      //TTABLEDATA_AHDDICTMEANING
    ahdDictSentenceDICT = [NSMutableDictionary dictionary];     //TTABLEDATA_AHDDICTSENTENCE
}

- (void)go
{
    _dbm = [WordsssDBDataManager wordsssDBDataManager];
    
    // Init Dicts
    [self initDicts];
    
    if (YES) {
        // CreateXMLParser
        [self createXmlParser];
        
        // Init ERIndicator
        _ERIndicator = 'E';
        
        // Start parse Entity
        [_parser parse];
    }
    
    if (YES) {
        // CreateXMLParser
        [self createXmlParser];
        
        // Change ERIndicator
        _ERIndicator = 'R';
        
        // Start parse Relationship
        [_parser parse];
    }
    
    // Save context
    [_dbm saveContext];
}

#pragma mark -

- (void)generateObject
{
    // M
    switch (ism) {
        case MNONE:
        {
            break;
        }
        case MMYSQLDUMP:
        {
            // D
            switch (isd) {
                case DNONE:
                {
                    break;
                }
                case DDATABASE:
                {
                    // T
                    switch (ist) {
                        case TNONE:
                        {
                            break;
                        }
                        case TTABLESTRUCTURE:
                        {
                            break;
                        }
                        case TTABLEDATA:
                        {
                            break;
                        }
                        default:
                        {
                            // T Entity
                            if (_ERIndicator == 'E') {
                                switch (ist) {
                                    case TTABLEDATA_WORD:   // Word
                                    {
                                        object = (Word*)[NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        Word_Relation* relation = (Word_Relation*)[NSEntityDescription insertNewObjectForEntityForName:@"Word_Relation" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        relation.word = ((Word*)object);
                                        ((Word*)object).word_relation = relation;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_FREQUENCY:   // Frequency
                                    {
                                        object = (Frequency*)[NSEntityDescription insertNewObjectForEntityForName:@"Frequency" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_ASSOCIATION:   // Association
                                    {
                                        object = (Association*)[NSEntityDescription insertNewObjectForEntityForName:@"Association" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_ROOTAFFIX:   // Rootaffix
                                    {
                                        object = (Rootaffix*)[NSEntityDescription insertNewObjectForEntityForName:@"Rootaffix" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_SENSE:   // Sense
                                    {
                                        object = (Sense*)[NSEntityDescription insertNewObjectForEntityForName:@"Sense" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MCECDICTWORD:   // MCECDictWord
                                    {
                                        object = (McecDictWord*)[NSEntityDescription insertNewObjectForEntityForName:@"McecDictWord" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MCECDICTMEANING:   // MCECDcitMeaning
                                    {
                                        object = (McecDictMeaning*)[NSEntityDescription insertNewObjectForEntityForName:@"McecDictMeaning" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }    
                                    case TTABLEDATA_MWCDICTWORD:   // MWCCDictWord
                                    {
                                        object = (MwcDictWord*)[NSEntityDescription insertNewObjectForEntityForName:@"MwcDictWord" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MWCDICTMEANING:   // MWCDcitMeaning
                                    {
                                        object = (MwcDictMeaning*)[NSEntityDescription insertNewObjectForEntityForName:@"MwcDictMeaning" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }    
                                    case TTABLEDATA_AHDDICTWORD:   // AhdDictWord
                                    {
                                        object = (AhdDictWord*)[NSEntityDescription insertNewObjectForEntityForName:@"AhdDictWord" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_AHDDICTMEANING:   // AhdDictMeaning
                                    {
                                        object = (AhdDictMeaning*)[NSEntityDescription insertNewObjectForEntityForName:@"AhdDictMeaning" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }    
                                    case TTABLEDATA_AHDDICTSENTENCE:   // AhdDictSentence
                                    {
                                        object = (AhdDictSentence*)[NSEntityDescription insertNewObjectForEntityForName:@"AhdDictSentence" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }    
                                    case TTABLEDATA_WORDASSOCIATION:   // Word_Association
                                    {
                                        object = (Word_Association*)[NSEntityDescription insertNewObjectForEntityForName:@"Word_Association" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDROOTAFFIX:   // Word_Rootaffix
                                    {
                                        object = (Word_Rootaffix*)[NSEntityDescription insertNewObjectForEntityForName:@"Word_Rootaffix" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDSENSE:   // Word_Sense
                                    {
                                        object = (Word_Sense*)[NSEntityDescription insertNewObjectForEntityForName:@"Word_Sense" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDDICT:   // Word_Dict
                                    {
                                        object = (Word_Dict*)[NSEntityDescription insertNewObjectForEntityForName:@"Word_Dict" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    default:
                                    {
                                        break;
                                    }
                                }
                            }
                            
                            // T Relationship
                            else if (_ERIndicator == 'R')
                            {
                                switch (ist) {
                                    default:
                                    {
                                        break;
                                    }
                                }
                            }
                            
                            break;
                        } 
                    }
                    
                    break;
                }
                default:
                {
                    break; 
                }
            }
            
            break;
        }
        default:
        {
            break;
        }
    }
}

- (void)setField:(NSString*)string
{
    // M
    switch (ism) {
        case MNONE:
        {
            break;
        }
        case MMYSQLDUMP:
        {
            // D
            switch (isd) {
                case DNONE:
                {
                    break;
                }
                case DDATABASE:
                {
                    // T
                    switch (ist) {
                        case TNONE:
                        {
                            break;
                        }
                        case TTABLESTRUCTURE:
                        {
                            break;
                        }
                        case TTABLEDATA:
                        {
                            break;
                        }
                        default:
                        {
                            //
                            if (isr == RNONE || isf == FNONE) {
                                break;
                            }
                            
                            // T Entity
                            if (_ERIndicator == 'E') {
                                switch (ist) {
                                    case TTABLEDATA_WORD:   // Word
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_id"] == NSOrderedSame) {
                                            ((Word*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [wordDICT setValue:object forKey:string];
                                            
                                            NSLog(@"Word - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_name"] == NSOrderedSame) {
                                            ((Word*)object).name = string;
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_ASSOCIATION:   // Association
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"association_id"] == NSOrderedSame) {
                                            ((Association*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [associationDICT setValue:object forKey:string];
                                            
                                            NSLog(@"Association - id: %@", string);
                                        }
                                        else if ([attrString compare:@"association_type"] == NSOrderedSame) {
                                            ((Association*)object).type = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        else if ([attrString compare:@"association_description_cn"] == NSOrderedSame) {
                                            ((Association*)object).description_cn = string;
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_ROOTAFFIX:   // Rootaffix
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"rootaffix_id"] == NSOrderedSame) {
                                            ((Rootaffix*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [rootaffixDICT setValue:object forKey:string];
                                            
                                            NSLog(@"Rootaffix - id: %@", string);
                                        }
                                        else if ([attrString compare:@"phrase"] == NSOrderedSame) {
                                            ((Rootaffix*)object).phrase = string;
                                        }
                                        else if ([attrString compare:@"deformation"] == NSOrderedSame) {
                                            if (!((Rootaffix*)object).deformation) {
                                                ((Rootaffix*)object).deformation = string;
                                            }
                                            else {
                                                ((Rootaffix*)object).deformation = [((Rootaffix*)object).deformation stringByAppendingFormat:@" %@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"type"] == NSOrderedSame) {
                                            ((Rootaffix*)object).type = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        else if ([attrString compare:@"origin"] == NSOrderedSame) {
                                            ((Rootaffix*)object).origin = string;
                                        }
                                        else if ([attrString compare:@"meaning_en"] == NSOrderedSame) {
                                            if (!((Rootaffix*)object).meaning_en) {
                                                ((Rootaffix*)object).meaning_en = string;
                                            }
                                            else {
                                                ((Rootaffix*)object).meaning_en = [((Rootaffix*)object).meaning_en stringByAppendingFormat:@" %@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                            if (!((Rootaffix*)object).meaning_cn) {
                                                ((Rootaffix*)object).meaning_cn = string;
                                            }
                                            else {
                                                ((Rootaffix*)object).meaning_cn = [((Rootaffix*)object).meaning_cn stringByAppendingFormat:@" %@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"description_en"] == NSOrderedSame) {
                                            ((Rootaffix*)object).description_en = string;
                                        }
                                        else if ([attrString compare:@"description_cn"] == NSOrderedSame) {
                                            ((Rootaffix*)object).description_cn = string;
                                        }
                                        
//                                        attrString = nil;
//                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_SENSE:   // Sense
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"sense_id"] == NSOrderedSame) {
                                            ((Sense*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [senseDICT setValue:object forKey:string];
                                            
                                            NSLog(@"Sense - id: %@", string);
                                        }
                                        else if ([attrString compare:@"meaning_en"] == NSOrderedSame) {
                                            ((Sense*)object).meaning_en = string;
                                        }
                                        else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                            ((Sense*)object).meaning_cn = string;
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_FREQUENCY:   // Frequency
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"frequency_id"] == NSOrderedSame) {
                                            ((Frequency*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [frequencyDICT setValue:object forKey:string];
                                            
                                            NSLog(@"Frequency - id: %@", string);
                                        }
                                        else if ([attrString compare:@"frequency"] == NSOrderedSame) {
                                            ((Frequency*)object).freq = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        else if ([attrString compare:@"frequency2"] == NSOrderedSame) {
                                            ((Frequency*)object).ra = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        else if ([attrString compare:@"frequency3"] == NSOrderedSame) {
                                            ((Frequency*)object).disp = [NSNumber numberWithFloat:[string floatValue]];
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MCECDICTWORD:   // MCECDictWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"mcec_dict_word_id"] == NSOrderedSame) {
                                            ((McecDictWord*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [mcecDictWordDICT setValue:object forKey:string];
                                            
                                            NSLog(@"McecDictWord - id: %@", string);
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MCECDICTMEANING:   // MCECDictMeaning
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"mcec_dict_meaning_id"] == NSOrderedSame) {
                                            ((McecDictMeaning*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [mcecDictMeaningDICT setValue:object forKey:string];
                                            
                                            NSLog(@"McecDictMeaning - id: %@", string);
                                        }
                                        else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                            ((McecDictMeaning*)object).meaning_cn = string;
                                        }
                                        else if ([attrString compare:@"type"] == NSOrderedSame) {
                                            ((McecDictMeaning*)object).type = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_AHDDICTWORD:   // AhdDictWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"ahd_dict_word_id"] == NSOrderedSame) {
                                            ((AhdDictWord*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [ahdDictWordDICT setValue:object forKey:string];
                                            
                                            NSLog(@"AhdDictWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"type"] == NSOrderedSame) {
                                            ((AhdDictWord*)object).type = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_AHDDICTMEANING:   // AhdDictMeaning
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"ahd_dict_meaning_id"] == NSOrderedSame) {
                                            ((AhdDictMeaning*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [ahdDictMeaningDICT setValue:object forKey:string];
                                            
                                            NSLog(@"AhdDictMeaning - id: %@", string);
                                        }
                                        else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                            ((AhdDictMeaning*)object).meaning_cn = string;
                                        }
                                        else if ([attrString compare:@"meaning_en"] == NSOrderedSame) {
                                            ((AhdDictMeaning*)object).meaning_en = string;
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_AHDDICTSENTENCE:   // AhdDictSentence
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"ahd_dict_sentence_id"] == NSOrderedSame) {
                                            ((AhdDictSentence*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [ahdDictSentenceDICT setValue:object forKey:string];
                                            
                                            NSLog(@"AhdDictSentence - id: %@", string);
                                        }
                                        else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                            ((AhdDictSentence*)object).meaning_cn = string;
                                        }
                                        else if ([attrString compare:@"meaning_en"] == NSOrderedSame) {
                                            ((AhdDictSentence*)object).meaning_en = string;
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDDICT:   // Word_Dict
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_dict_id"] == NSOrderedSame) {
                                            ((Word_Dict*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [wordDictDICT setValue:object forKey:string];
                                            
                                            NSLog(@"WordDict - id: %@", string);
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDASSOCIATION:   // Word_Association
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_association_id"] == NSOrderedSame) {
                                            ((Word_Association*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [wordAssociationDICT setValue:object forKey:string];
                                            
                                            NSLog(@"WordAssociation - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_meaning"] == NSOrderedSame) {
                                            ((Word_Association*)object).meaning_cn = string;
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDROOTAFFIX:   // Word_Rootaffix
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_rootaffix_id"] == NSOrderedSame) {
                                            ((Word_Rootaffix*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [wordRootaffixDICT setValue:object forKey:string];
                                            
                                            NSLog(@"WordRootaffix - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_meaning"] == NSOrderedSame) {
                                            if (!((Word_Rootaffix*)object).meaning_cn) {
                                                ((Word_Rootaffix*)object).meaning_cn = string;
                                            }
                                            else {
                                                ((Word_Rootaffix*)object).meaning_cn = [((Word_Rootaffix*)object).meaning_cn stringByAppendingFormat:@" %@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"word_deformation"] == NSOrderedSame) {
                                            if (!((Word_Rootaffix*)object).equation) {
                                                ((Word_Rootaffix*)object).equation = string;
                                            }
                                            else {
                                                ((Word_Rootaffix*)object).equation = [((Word_Rootaffix*)object).equation stringByAppendingFormat:@" %@", string];
                                            }
                                        }
                                        
//                                        attrString = nil;
//                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDSENSE:   // Word_Sense
                                    {                                        
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_sense_id"] == NSOrderedSame) {
                                            ((Word_Sense*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [wordSenseDICT setValue:object forKey:string];
                                            
                                            NSLog(@"WordSense - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_meaning"] == NSOrderedSame) {
                                            if (!((Word_Sense*)object).meaning_cn) {
                                                ((Word_Sense*)object).meaning_cn = string;
                                            }
                                            else {
                                                ((Word_Sense*)object).meaning_cn = [((Word_Sense*)object).meaning_cn stringByAppendingFormat:@" %@", string];
                                            }
                                        }
                                        
                                        // attrString = nil;
                                        // attrDict = nil;
                                        
                                        break;
                                    }
                                    default:
                                    {
                                        break;
                                    }
                                }
                            }
                            
                            // T Relationship
                            else if (_ERIndicator == 'R') {
                                switch (ist) {
                                    case TTABLEDATA_WORDDICT:   // Word_Dict
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_dict_id"] == NSOrderedSame) {
                                            object = (Word_Dict *)[wordDictDICT objectForKey:string];
                                            
                                            NSLog(@"WordDict - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                ((Word_Dict*)object).word = word;
                                                word.word_dict = ((Word_Dict*)object);
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_FREQUENCY:   // Frequency
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"frequency_id"] == NSOrderedSame) {
                                            object = (Frequency *)[frequencyDICT objectForKey:string];
                                            
                                            NSLog(@"Frequency - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                ((Word_Dict*)object).word = word;
                                                word.frequency = ((Frequency*)object);
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDASSOCIATION:   // Word_Association
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_association_id"] == NSOrderedSame) {
                                            object = [wordAssociationDICT objectForKey:string];
                                            
                                            NSLog(@"WordAssociation - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                ((Word_Association*)object).word = word;
                                                [word.word_association addObject:((Word_Association*)object)];
                                            }
                                        }
                                        else if ([attrString compare:@"association_id"] == NSOrderedSame) {
                                            Association* association = [associationDICT objectForKey:string];
                                            
                                            if (association) {
                                                ((Word_Association*)object).association = association;
                                                [association.word_association addObject:((Word_Association*)object)];
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDROOTAFFIX:   // Word_Rootaffix
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_rootaffix_id"] == NSOrderedSame) {
                                            object = [wordRootaffixDICT objectForKey:string];
                                            
                                            NSLog(@"WordRootaffix - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                ((Word_Rootaffix*)object).word = word;
                                                [word.word_rootaffix addObject:((Word_Rootaffix*)object)];
                                            }
                                        }
                                        else if ([attrString compare:@"rootaffix_id"] == NSOrderedSame) {
                                            Rootaffix* rootaffix = [rootaffixDICT objectForKey:string];
                                            
                                            if (rootaffix) {
                                                ((Word_Rootaffix*)object).rootaffix = rootaffix;
                                                [rootaffix.word_rootaffix addObject:((Word_Rootaffix*)object)];
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDSENSE:   // Word_Sense
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_sense_id"] == NSOrderedSame) {
                                            object = (Word_Sense*)[wordSenseDICT objectForKey:string];
                                            
                                            NSLog(@"WordSense - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                ((Word_Sense*)object).word = word;
                                                [word.word_sense addObject:((Word_Sense*)object)];
                                            }
                                        }
                                        else if ([attrString compare:@"sense_id"] == NSOrderedSame) {
                                            Sense* sense = [senseDICT objectForKey:string];
                                            
                                            if (sense) {
                                                ((Word_Sense*)object).sense = sense;
                                                [sense.word_sense addObject:((Word_Sense*)object)];
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_SENSEFAMILY:   // Sense_Family
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"sense_family_id"] == NSOrderedSame) {
                                            NSLog(@"SenseFamily - id: %@", string);
                                        }
                                        else if ([attrString compare:@"parent_sense_id"] == NSOrderedSame) {
                                            object = (Sense*)[senseDICT objectForKey:string];                                            
                                        }
                                        else if ([attrString compare:@"son_sense_id"] == NSOrderedSame) {
                                            Sense* sense = [senseDICT objectForKey:string];
                                            
                                            if (sense) {
                                                [((Sense*)object).son addObject:sense];
                                                sense.parent = (Sense*)object;
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MCECDICTMEANING:   // McecDictMeaning
                                    {
                                        break;
                                        
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"mcec_dict_meaning_id"] == NSOrderedSame) {
                                            object = (McecDictMeaning*)[mcecDictMeaningDICT objectForKey:string];
                                            
                                            NSLog(@"McecDictMeaning - id: %@", string);
                                        }
                                        else if ([attrString compare:@"mcec_dict_word_id"] == NSOrderedSame) {                                            
                                            McecDictWord* word = [McecDictWord wordWithId:[NSNumber numberWithInt:[string intValue]] inManagedObjectContext:_dbm.managedObjectContext];
                                            
                                            if (word && object) {
                                                ((McecDictMeaning*)object).mcecDictWord = word;
                                                [word.meaning addObject:((McecDictMeaning*)object)];
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_AHDDICTWORD:   // AhdDictWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"ahd_dict_word_id"] == NSOrderedSame) {
                                            object = (AhdDictWord*)[ahdDictWordDICT objectForKey:string];
                                            
                                            NSLog(@"AhdDictWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_dict_id"] == NSOrderedSame) {
                                            Word_Dict* word_dict = [wordDictDICT objectForKey:string];
                                            
                                            if (word_dict) {
                                                ((AhdDictWord*)object).word_dict = word_dict;
                                                [word_dict.ahdDictWord addObject:((AhdDictWord*)object)];
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_AHDDICTMEANING:   // AhdDictMeaning
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"ahd_dict_meaning_id"] == NSOrderedSame) {
                                            object = (AhdDictMeaning*)[ahdDictMeaningDICT objectForKey:string];
                                            
                                            NSLog(@"AhdDictMeaning - id: %@", string);
                                        }
                                        else if ([attrString compare:@"ahd_dict_word_id"] == NSOrderedSame) {
                                            AhdDictWord* ahdDictWord = [ahdDictWordDICT objectForKey:string];
                                            
                                            if (ahdDictWord) {
                                                ((AhdDictMeaning*)object).ahdDictWord = ahdDictWord;
                                                [ahdDictWord.meaning addObject:(AhdDictMeaning*)object];
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_AHDDICTSENTENCE:   // AhdDictSentence
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"ahd_dict_sentence_id"] == NSOrderedSame) {
                                            object = (AhdDictSentence*)[ahdDictSentenceDICT objectForKey:string];
                                            
                                            NSLog(@"AhdDictSentence - id: %@", string);
                                        }
                                        else if ([attrString compare:@"ahd_dict_meaning_id"] == NSOrderedSame) {
                                            AhdDictMeaning* ahdDictMeaning = [ahdDictMeaningDICT objectForKey:string];
                                            
                                            if (ahdDictMeaning) {
                                                ((AhdDictSentence*)object).ahdDictMeaning = ahdDictMeaning;
                                                ahdDictMeaning.ahdDictSentence = ((AhdDictSentence*)object);
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_CONVERSION:   // Conversion
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_conversion_id"] == NSOrderedSame) {
                                            NSLog(@"Conversion - id: %@", string);
                                        }
                                        else if ([attrString compare:@"base_word_id"] == NSOrderedSame) {
                                            object = (Word*)[wordDICT objectForKey:string];                                            
                                        }
                                        else if ([attrString compare:@"convresion_word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                [((Word*)object).word_relation.conversion addObject:word];
                                                word.word_relation.convOrig = (Word*)object;
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_DERIVATION:   // Derivation
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_derivation_id"] == NSOrderedSame) {
                                            NSLog(@"Derivation - id: %@", string);
                                        }
                                        else if ([attrString compare:@"base_word_id"] == NSOrderedSame) {
                                            object = (Word*)[wordDICT objectForKey:string];                                            
                                        }
                                        else if ([attrString compare:@"derivation_word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                [((Word*)object).word_relation.derivative addObject:word];
                                                word.word_relation.deriOrig = (Word*)object;
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_SYNONYM:   // Synonym
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"synonym_id"] == NSOrderedSame) {
                                            NSLog(@"Synonym - id: %@", string);
                                        }
                                        else if ([attrString compare:@"base_word_id"] == NSOrderedSame) {
                                            object = (Word*)[wordDICT objectForKey:string];                                            
                                        }
                                        else if ([attrString compare:@"synonym_word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                [((Word*)object).word_relation.synonym addObject:word];
                                                [word.word_relation.synonym addObject:(Word*)object];
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    case TTABLEDATA_ANTONYM:   // Antonym
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"antonym_id"] == NSOrderedSame) {
                                            NSLog(@"Antonym - id: %@", string);
                                        }
                                        else if ([attrString compare:@"base_word_id"] == NSOrderedSame) {
                                            object = (Word*)[wordDICT objectForKey:string];                                            
                                        }
                                        else if ([attrString compare:@"antonym_word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                [((Word*)object).word_relation.antonym addObject:word];
                                                [word.word_relation.antonym addObject:(Word*)object];
                                            }
                                        }
                                        
                                        attrString = nil;
                                        attrDict = nil;
                                        
                                        break;
                                    }
                                    default:
                                    {
                                        break;
                                    }
                                }
                            }
                            
                            break;
                        }
                    }
                    
                    break;
                }
                default:
                {
                    break; 
                }
            }
            
            break;
        }
        default:
        {
            break;
        }
    }
}

#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    
    if ([elementName compare:@"mysqldump"] == NSOrderedSame) {
        ism = MMYSQLDUMP;
    }
    else if ([elementName compare:@"database"] == NSOrderedSame) {
        isd = DDATABASE;
    }
    else if ([elementName compare:@"table_structure"] == NSOrderedSame) {
        ist = TTABLESTRUCTURE;
    }
    else if ([elementName compare:@"table_data"] == NSOrderedSame) {
        ist = TTABLEDATA;
        
        // Specified table
        NSString* name = [attributeDict objectForKey:@"name"];
        if ([name compare:@"association"] == NSOrderedSame) {
            ist = TTABLEDATA_ASSOCIATION;
        }
        else if ([name compare:@"frequency"] == NSOrderedSame) {
            ist = TTABLEDATA_FREQUENCY;
        }
        else if ([name compare:@"dota_list_word"] == NSOrderedSame) {
            ist = TTABLEDATA_DOTALISTWORD;
        }
        else if ([name compare:@"mcec_dict_meaning"] == NSOrderedSame) {
            ist = TTABLEDATA_MCECDICTMEANING;
        }
        else if ([name compare:@"mcec_dict_word"] == NSOrderedSame) {
            ist = TTABLEDATA_MCECDICTWORD;
        }
        else if ([name compare:@"mwc_dict_meaning"] == NSOrderedSame) {
            ist = TTABLEDATA_MWCDICTMEANING;
        }
        else if ([name compare:@"mwc_dict_word"] == NSOrderedSame) {
            ist = TTABLEDATA_MWCDICTWORD;
        }
        else if ([name compare:@"ahd_dict_meaning"] == NSOrderedSame) {
            ist = TTABLEDATA_AHDDICTMEANING;
        }
        else if ([name compare:@"ahd_dict_word"] == NSOrderedSame) {
            ist = TTABLEDATA_AHDDICTWORD;
        }
        else if ([name compare:@"ahd_dict_sentence"] == NSOrderedSame) {
            ist = TTABLEDATA_AHDDICTSENTENCE;
        }
        else if ([name compare:@"rootaffix"] == NSOrderedSame) {
            ist = TTABLEDATA_ROOTAFFIX;
        }
        else if ([name compare:@"sense"] == NSOrderedSame) {
            ist = TTABLEDATA_SENSE;
        }
        else if ([name compare:@"sense_family"] == NSOrderedSame) {
            ist = TTABLEDATA_SENSEFAMILY;
        }
        else if ([name compare:@"word"] == NSOrderedSame) {
            ist = TTABLEDATA_WORD;
        }
        else if ([name compare:@"word_association"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDASSOCIATION;
        }
        else if ([name compare:@"word_dict"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDDICT;
        }
        else if ([name compare:@"word_list"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDLIST;
        }
        else if ([name compare:@"word_rootaffix"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDROOTAFFIX;
        }
        else if ([name compare:@"word_sense"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDSENSE;
        }
        else if ([name compare:@"word_conversion"] == NSOrderedSame) {
            ist = TTABLEDATA_CONVERSION;
        }
        else if ([name compare:@"word_derivation"] == NSOrderedSame) {
            ist = TTABLEDATA_DERIVATION;
        }
        else if ([name compare:@"synonym"] == NSOrderedSame) {
            ist = TTABLEDATA_SYNONYM;
        }
        else if ([name compare:@"antonym"] == NSOrderedSame) {
            ist = TTABLEDATA_ANTONYM;
        }
    }
    else if ([elementName compare:@"row"] == NSOrderedSame) {
        isr = RROW;
        
        // Create object
        [self generateObject];
    }
    else if ([elementName compare:@"field"] == NSOrderedSame) {
        isf = FFIELD;
        
        // Store field info
        attrDict = attributeDict;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName compare:@"mysqldump"] == NSOrderedSame) {
        ism = MNONE;
    }
    else if ([elementName compare:@"database"] == NSOrderedSame) {
        isd = DNONE;
    }
    else if ([elementName compare:@"table_structure"] == NSOrderedSame) {
        ist = TNONE;
    }
    else if ([elementName compare:@"table_data"] == NSOrderedSame) {
        ist = TNONE;
    }
    else if ([elementName compare:@"row"] == NSOrderedSame) {
        isr = RNONE;
    }
    else if ([elementName compare:@"field"] == NSOrderedSame) {
        isf = FNONE;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [self setField:string];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    
}

@end
