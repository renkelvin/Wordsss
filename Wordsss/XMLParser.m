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

NSMutableDictionary* wordListDICT = nil;            //TTABLEDATA_WORDLIST

NSMutableDictionary* csListWordDICT = nil;          //TTABLEDATA_CSLISTWORD
NSMutableDictionary* maListWordDICT = nil;          //TTABLEDATA_MALISTWORD
NSMutableDictionary* phListWordDICT = nil;          //TTABLEDATA_PHLISTWORD
NSMutableDictionary* grerbListWordDICT = nil;       //TTABLEDATA_GRERBLISTWORD
NSMutableDictionary* grerbListMemDICT = nil;       //TTABLEDATA_GRERBLISTMEM
NSMutableDictionary* dotaListWordDICT = nil;        //TTABLEDATA_DOTALISTWORD

NSMutableDictionary* listDICT = nil;                //TTABLEDATA_LIST

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
    wordListDICT = [NSMutableDictionary dictionary];            //TTABLEDATA_WORDLIST
    csListWordDICT = [NSMutableDictionary dictionary];          //TTABLEDATA_CSLISTWORD
    maListWordDICT = [NSMutableDictionary dictionary];          //TTABLEDATA_MALISTWORD
    phListWordDICT = [NSMutableDictionary dictionary];          //TTABLEDATA_PHLISTWORD
    grerbListWordDICT = [NSMutableDictionary dictionary];       //TTABLEDATA_GRERBLISTWORD
    grerbListMemDICT = [NSMutableDictionary dictionary];       //TTABLEDATA_GRERBLISTMEM
    dotaListWordDICT = [NSMutableDictionary dictionary];        //TTABLEDATA_DOTALISTWORD
    listDICT = [NSMutableDictionary dictionary];                //TTABLEDATA_LIST
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
                                    case TTABLEDATA_WORDLIST:   // Word_List
                                    {
                                        object = (Word_List*)[NSEntityDescription insertNewObjectForEntityForName:@"Word_List" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_CSLISTWORD:   // CSListWord
                                    {
                                        object = (CSListWord*)[NSEntityDescription insertNewObjectForEntityForName:@"CSListWord" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MALISTWORD:   // MAListWord
                                    {
                                        object = (MAListWord*)[NSEntityDescription insertNewObjectForEntityForName:@"MAListWord" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_PHLISTWORD:   // PHListWord
                                    {
                                        object = (PHListWord*)[NSEntityDescription insertNewObjectForEntityForName:@"PHListWord" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_GRERBLISTWORD:   // GRERBListWord
                                    {
                                        object = (GRERBListWord*)[NSEntityDescription insertNewObjectForEntityForName:@"GRERBListWord" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_GRERBLISTMEM:   // GRERBListMem
                                    {
                                        object = (GRERBListMem*)[NSEntityDescription insertNewObjectForEntityForName:@"GRERBListMem" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_DOTALISTWORD:   // DOTAListWord
                                    {
                                        object = (DotaListWord*)[NSEntityDescription insertNewObjectForEntityForName:@"DotaListWord" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
                                        break;
                                    }
                                    case TTABLEDATA_LIST:   // List
                                    {
                                        object = (List*)[NSEntityDescription insertNewObjectForEntityForName:@"List" inManagedObjectContext:[_dbm managedObjectContext]];
                                        
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
                                            
                                            // NSLog(@"Word - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_name"] == NSOrderedSame) {
                                            ((Word*)object).name = string;
                                            
                                            // Create Pureword
                                            PureWord* pw = [NSEntityDescription insertNewObjectForEntityForName:@"PureWord" inManagedObjectContext:[_dbm managedObjectContext]];
                                            pw.name = string;
                                            pw.word = (Word*)object;
                                        }
                                        
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
                                            
                                            // NSLog(@"Association - id: %@", string);
                                        }
                                        else if ([attrString compare:@"association_type"] == NSOrderedSame) {
                                            ((Association*)object).type = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        else if ([attrString compare:@"association_description_cn"] == NSOrderedSame) {
                                            if (!((Association*)object).description_cn) {
                                                ((Association*)object).description_cn = string;
                                            }
                                            else {
                                                ((Association*)object).description_cn = [((Association*)object).description_cn stringByAppendingFormat:@"%@", string];
                                            }
                                            
                                            // NSLog(@"%@", ((Association*)object).description_cn);
                                        }
                                        
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
                                            
                                            // NSLog(@"Rootaffix - id: %@", string);
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
                                                ((Rootaffix*)object).meaning_cn = [((Rootaffix*)object).meaning_cn stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"description_en"] == NSOrderedSame) {
                                            if (!((Rootaffix*)object).description_en) {
                                                ((Rootaffix*)object).description_en = string;
                                            }
                                            else {
                                                ((Rootaffix*)object).description_en = [((Rootaffix*)object).description_en stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"description_cn"] == NSOrderedSame) {
                                            if (!((Rootaffix*)object).description_cn) {
                                                ((Rootaffix*)object).description_cn = string;
                                            }
                                            else {
                                                ((Rootaffix*)object).description_cn = [((Rootaffix*)object).description_cn stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
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
                                            
                                            // NSLog(@"Sense - id: %@", string);
                                        }
                                        else if ([attrString compare:@"meaning_en"] == NSOrderedSame) {
                                            if (!((Sense*)object).meaning_en) {
                                                ((Sense*)object).meaning_en = string;
                                            }
                                            else {
                                                ((Sense*)object).meaning_en = [((Sense*)object).meaning_en stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                            if (!((Sense*)object).meaning_cn) {
                                                ((Sense*)object).meaning_cn = string;
                                            }
                                            else {
                                                ((Sense*)object).meaning_cn = [((Sense*)object).meaning_cn stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
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
                                            
                                            // NSLog(@"Frequency - id: %@", string);
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
                                            
                                            // NSLog(@"WordDict - id: %@", string);
                                        }
                                        
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
                                            
                                            // NSLog(@"McecDictWord - id: %@", string);
                                        }
                                        
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
                                            
                                            // NSLog(@"McecDictMeaning - id: %@", string);
                                        }
                                        else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                            ((McecDictMeaning*)object).meaning_cn = string;
                                        }
                                        else if ([attrString compare:@"type"] == NSOrderedSame) {
                                            ((McecDictMeaning*)object).type = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        
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
                                            
                                            // NSLog(@"AhdDictWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"type"] == NSOrderedSame) {
                                            ((AhdDictWord*)object).type = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        
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
                                            
                                            // NSLog(@"AhdDictMeaning - id: %@", string);
                                        }
                                        else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                            if (!((AhdDictMeaning*)object).meaning_cn) {
                                                ((AhdDictMeaning*)object).meaning_cn = string;
                                            }
                                            else {
                                                ((AhdDictMeaning*)object).meaning_cn = [((AhdDictMeaning*)object).meaning_cn stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"meaning_en"] == NSOrderedSame) {
                                            if (!((AhdDictMeaning*)object).meaning_en) {
                                                ((AhdDictMeaning*)object).meaning_en = string;
                                            }
                                            else {
                                                ((AhdDictMeaning*)object).meaning_en = [((AhdDictMeaning*)object).meaning_en stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MWCDICTWORD:   // MwcDictWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"mwc_dict_word_id"] == NSOrderedSame) {
                                            ((MwcDictWord*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [mwcDictWordDICT setValue:object forKey:string];
                                            
                                            // NSLog(@"MwcDictWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"function"] == NSOrderedSame) {
                                            if (!((MwcDictWord*)object).function) {
                                                ((MwcDictWord*)object).function = string;
                                            }
                                            else {
                                                ((MwcDictWord*)object).function = [((MwcDictWord*)object).function stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"etymology"] == NSOrderedSame) {
                                            if (!((MwcDictWord*)object).etymology) {
                                                ((MwcDictWord*)object).etymology = string;
                                            }
                                            else {
                                                ((MwcDictWord*)object).etymology = [((MwcDictWord*)object).etymology stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"inflectform"] == NSOrderedSame) {
                                            if (!((MwcDictWord*)object).inflectform) {
                                                ((MwcDictWord*)object).inflectform = string;
                                            }
                                            else {
                                                ((MwcDictWord*)object).inflectform = [((MwcDictWord*)object).inflectform stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"date"] == NSOrderedSame) {
                                            if (!((MwcDictWord*)object).date) {
                                                ((MwcDictWord*)object).date = string;
                                            }
                                            else {
                                                ((MwcDictWord*)object).date = [((MwcDictWord*)object).date stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MWCDICTMEANING:   // MwcDictMeaning
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"mwc_dict_meaning_id"] == NSOrderedSame) {
                                            ((MwcDictMeaning*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [mwcDictMeaningDICT setValue:object forKey:string];
                                            
                                            // NSLog(@"MwcDictMeaning - id: %@", string);
                                        }
                                        else if ([attrString compare:@"meaning_en"] == NSOrderedSame) {
                                            if (!((MwcDictMeaning*)object).meaning_en) {
                                                ((MwcDictMeaning*)object).meaning_en = string;
                                            }
                                            else {
                                                ((MwcDictMeaning*)object).meaning_en = [((MwcDictMeaning*)object).meaning_en stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
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
                                            
                                            // NSLog(@"AhdDictSentence - id: %@", string);
                                        }
                                        else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                            if (!((AhdDictSentence*)object).meaning_cn) {
                                                ((AhdDictSentence*)object).meaning_cn = string;
                                            }
                                            else {
                                                ((AhdDictSentence*)object).meaning_cn = [((AhdDictSentence*)object).meaning_cn stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"meaning_en"] == NSOrderedSame) {
                                            if (!((AhdDictSentence*)object).meaning_en) {
                                                ((AhdDictSentence*)object).meaning_en = string;
                                            }
                                            else {
                                                ((AhdDictSentence*)object).meaning_en = [((AhdDictSentence*)object).meaning_en stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDLIST:   // Word_List
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_list_id"] == NSOrderedSame) {
                                            ((Word_List*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [wordListDICT setValue:object forKey:string];
                                            
                                            // NSLog(@"WordList - id: %@", string);
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_CSLISTWORD:   // CSListWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"cs_list_word_id"] == NSOrderedSame) {
                                            ((CSListWord*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [csListWordDICT setValue:object forKey:string];
                                            
                                            // NSLog(@"CSListWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_meaning"] == NSOrderedSame) {
                                            if (!((CSListWord*)object).meaning) {
                                                ((CSListWord*)object).meaning = string;
                                            }
                                            else {
                                                ((CSListWord*)object).meaning = [((CSListWord*)object).meaning stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"full_name"] == NSOrderedSame) {
                                            if (!((CSListWord*)object).fullname) {
                                                ((CSListWord*)object).fullname = string;
                                            }
                                            else {
                                                ((CSListWord*)object).fullname = [((CSListWord*)object).fullname stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MALISTWORD:   // MAListWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"ma_list_word_id"] == NSOrderedSame) {
                                            ((MAListWord*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [maListWordDICT setValue:object forKey:string];
                                            
                                            // NSLog(@"MAListWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_meaning"] == NSOrderedSame) {
                                            if (!((MAListWord*)object).meaning) {
                                                ((MAListWord*)object).meaning = string;
                                            }
                                            else {
                                                ((MAListWord*)object).meaning = [((MAListWord*)object).meaning stringByAppendingFormat:@"%@", string];
                                            }
                                            
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_PHLISTWORD:   // PHListWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"ph_list_word_id"] == NSOrderedSame) {
                                            ((PHListWord*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [phListWordDICT setValue:object forKey:string];
                                            
                                            // NSLog(@"PHListWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_meaning"] == NSOrderedSame) {
                                            if (!((PHListWord*)object).meaning) {
                                                ((PHListWord*)object).meaning = string;
                                            }
                                            else {
                                                ((PHListWord*)object).meaning = [((PHListWord*)object).meaning stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_GRERBLISTWORD:   // GRERBListWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"gre_list_word_id"] == NSOrderedSame) {
                                            ((GRERBListWord*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [grerbListWordDICT setValue:object forKey:string];
                                            
                                            // NSLog(@"GRERBListWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_meaning"] == NSOrderedSame) {
                                            if (!((GRERBListWord*)object).meaning_cn) {
                                                ((GRERBListWord*)object).meaning_cn = string;
                                            }
                                            else {
                                                ((GRERBListWord*)object).meaning_cn = [((GRERBListWord*)object).meaning_cn stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_GRERBLISTMEM:   // GRERBListMem
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"gre_list_memory_id"] == NSOrderedSame) {
                                            ((GRERBListMem*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [grerbListMemDICT setValue:object forKey:string];
                                            
                                            // NSLog(@"GRERBListMem - id: %@", string);
                                        }
                                        else if ([attrString compare:@"memory_description"] == NSOrderedSame) {
                                            if (!((GRERBListMem*)object).description_cn) {
                                                ((GRERBListMem*)object).description_cn = string;
                                            }
                                            else {
                                                ((GRERBListMem*)object).description_cn = [((GRERBListMem*)object).description_cn stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"memory_type"] == NSOrderedSame) {
                                            int t = 0;
                                            if ([string compare:@"记"] == NSOrderedSame) {
                                                t = 1;
                                            }
                                            else if ([string compare:@"同"] == NSOrderedSame) {
                                                t = 2;
                                            }
                                            else if ([string compare:@"反"] == NSOrderedSame) {
                                                t = 3;
                                            }
                                            else if ([string compare:@"派"] == NSOrderedSame) {
                                                t = 4;
                                            }
                                            else if ([string compare:@"参"] == NSOrderedSame) {
                                                t = 5;
                                            }
                                            else if ([string compare:@"类"] == NSOrderedSame) {
                                                t = 6;
                                            }
                                            else if ([string compare:@"例"] == NSOrderedSame) {
                                                t = 7;
                                            }
                                            
                                            ((GRERBListMem*)object).type = [NSNumber numberWithInt:t];
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_DOTALISTWORD:   // DOTAListWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"dota_list_word_id"] == NSOrderedSame) {
                                            ((DotaListWord*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [dotaListWordDICT setValue:object forKey:string];
                                            
                                            // NSLog(@"DOTAListWord - id: %@", string);
                                        }
                                        
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
                                            
                                            // NSLog(@"WordAssociation - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_meaning"] == NSOrderedSame) {
                                            if (!((Word_Association*)object).meaning_cn) {
                                                ((Word_Association*)object).meaning_cn = string;
                                            }
                                            else {
                                                ((Word_Association*)object).meaning_cn = [((Word_Association*)object).meaning_cn stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
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
                                            
                                            // NSLog(@"WordRootaffix - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_meaning"] == NSOrderedSame) {
                                            if (!((Word_Rootaffix*)object).meaning_cn) {
                                                ((Word_Rootaffix*)object).meaning_cn = string;
                                            }
                                            else {
                                                ((Word_Rootaffix*)object).meaning_cn = [((Word_Rootaffix*)object).meaning_cn stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        else if ([attrString compare:@"word_equation"] == NSOrderedSame) {
                                            if (!((Word_Rootaffix*)object).equation) {
                                                ((Word_Rootaffix*)object).equation = string;
                                            }
                                            else {
                                                ((Word_Rootaffix*)object).equation = [((Word_Rootaffix*)object).equation stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
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
                                            
                                            // NSLog(@"WordSense - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_meaning"] == NSOrderedSame) {
                                            if (!((Word_Sense*)object).meaning_cn) {
                                                ((Word_Sense*)object).meaning_cn = string;
                                            }
                                            else {
                                                ((Word_Sense*)object).meaning_cn = [((Word_Sense*)object).meaning_cn stringByAppendingFormat:@"%@", string];
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_LIST:   // List
                                    {                                        
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"list_id"] == NSOrderedSame) {
                                            ((List*)object).id = [NSNumber numberWithInt:[string intValue]];
                                            
                                            [listDICT setValue:object forKey:string];
                                            
                                            // NSLog(@"List - id: %@", string);
                                        }
                                        else if ([attrString compare:@"name"] == NSOrderedSame) {
                                            ((List*)object).name = string;
                                        }
                                        else if ([attrString compare:@"count"] == NSOrderedSame) {
                                            ((List*)object).num = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        else if ([attrString compare:@"type"] == NSOrderedSame) {
                                            ((List*)object).type = [NSNumber numberWithInt:[string intValue]];
                                        }
                                        
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
                                    case TTABLEDATA_FREQUENCY:   // Frequency
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"frequency_id"] == NSOrderedSame) {
                                            object = (Frequency *)[frequencyDICT objectForKey:string];
                                            
                                            // NSLog(@"Frequency - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                ((Word_Dict*)object).word = word;
                                                word.frequency = ((Frequency*)object);
                                            }
                                        }
                                        
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
                                            
                                            // NSLog(@"WordAssociation - id: %@", string);
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
                                            
                                            // NSLog(@"WordRootaffix - id: %@", string);
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
                                            
                                            // NSLog(@"WordSense - id: %@", string);
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
                                            // NSLog(@"SenseFamily - id: %@", string);
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
                                            object = (Word_Dict *)[wordDictDICT objectForKey:string];
                                            
                                            // NSLog(@"WordDict - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                ((Word_Dict*)object).word = word;
                                                word.word_dict = ((Word_Dict*)object);
                                            }
                                        }
                                        
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
                                            
                                            // NSLog(@"McecDictMeaning - id: %@", string);
                                        }
                                        else if ([attrString compare:@"mcec_dict_word_id"] == NSOrderedSame) {                                            
                                            McecDictWord* word = [McecDictWord wordWithId:[NSNumber numberWithInt:[string intValue]] inManagedObjectContext:_dbm.managedObjectContext];
                                            
                                            if (word && object) {
                                                ((McecDictMeaning*)object).mcecDictWord = word;
                                                [word.meaning addObject:((McecDictMeaning*)object)];
                                            }
                                        }
                                        
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
                                            
                                            // NSLog(@"AhdDictWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_dict_id"] == NSOrderedSame) {
                                            Word_Dict* word_dict = [wordDictDICT objectForKey:string];
                                            
                                            if (word_dict) {
                                                ((AhdDictWord*)object).word_dict = word_dict;
                                                [word_dict.ahdDictWord addObject:((AhdDictWord*)object)];
                                            }
                                        }
                                        
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
                                            
                                            // NSLog(@"AhdDictMeaning - id: %@", string);
                                        }
                                        else if ([attrString compare:@"ahd_dict_word_id"] == NSOrderedSame) {
                                            AhdDictWord* ahdDictWord = [ahdDictWordDICT objectForKey:string];
                                            
                                            if (ahdDictWord) {
                                                ((AhdDictMeaning*)object).ahdDictWord = ahdDictWord;
                                                [ahdDictWord.meaning addObject:(AhdDictMeaning*)object];
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MWCDICTWORD:   // MwcDictWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"mwc_dict_word_id"] == NSOrderedSame) {
                                            object = (MwcDictWord*)[mwcDictWordDICT objectForKey:string];
                                            
                                            // NSLog(@"MwcDictWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_dict_id"] == NSOrderedSame) {
                                            Word_Dict* word_dict = [wordDictDICT objectForKey:string];
                                            
                                            if (word_dict) {
                                                ((MwcDictWord*)object).word_dict = word_dict;
                                                [word_dict.mwcDictWord addObject:((MwcDictWord*)object)];
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MWCDICTMEANING:   // MwcDictMeaning
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"mwc_dict_meaning_id"] == NSOrderedSame) {
                                            object = (MwcDictMeaning*)[mwcDictMeaningDICT objectForKey:string];
                                            
                                            // NSLog(@"MwcDictMeaning - id: %@", string);
                                        }
                                        else if ([attrString compare:@"mwc_dict_word_id"] == NSOrderedSame) {
                                            MwcDictWord* mwcDictWord = [mwcDictWordDICT objectForKey:string];
                                            
                                            if (mwcDictWord) {
                                                ((MwcDictMeaning*)object).mwcDictWord = mwcDictWord;
                                                [mwcDictWord.meaning addObject:(MwcDictMeaning*)object];
                                            }
                                        }
                                        
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
                                            
                                            // NSLog(@"AhdDictSentence - id: %@", string);
                                        }
                                        else if ([attrString compare:@"ahd_dict_meaning_id"] == NSOrderedSame) {
                                            AhdDictMeaning* ahdDictMeaning = [ahdDictMeaningDICT objectForKey:string];
                                            
                                            if (ahdDictMeaning) {
                                                ((AhdDictSentence*)object).ahdDictMeaning = ahdDictMeaning;
                                                ahdDictMeaning.ahdDictSentence = ((AhdDictSentence*)object);
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_WORDLIST:   // Word_List
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"word_list_id"] == NSOrderedSame) {
                                            object = (Word_List *)[wordListDICT objectForKey:string];
                                            
                                            // NSLog(@"WordList - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_id"] == NSOrderedSame) {
                                            Word* word = [wordDICT objectForKey:string];
                                            
                                            if (word) {
                                                ((Word_List*)object).word = word;
                                                word.word_list = ((Word_List*)object);
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_CSLISTWORD:   // CSListWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"cs_list_word_id"] == NSOrderedSame) {
                                            object = (CSListWord *)[csListWordDICT objectForKey:string];
                                            
                                            // NSLog(@"CSListWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_list_id"] == NSOrderedSame) {
                                            Word_List* word_list = [wordListDICT objectForKey:string];
                                            
                                            if (word_list) {
                                                ((CSListWord*)object).word_list = word_list;
                                                word_list.csListWord = ((CSListWord*)object);
                                            }
                                        }
                                        
                                        
                                        break;
                                    }
                                    case TTABLEDATA_MALISTWORD:   // MAListWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"ma_list_word_id"] == NSOrderedSame) {
                                            object = (MAListWord *)[maListWordDICT objectForKey:string];
                                            
                                            // NSLog(@"MAListWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_list_id"] == NSOrderedSame) {
                                            Word_List* word_list = [wordListDICT objectForKey:string];
                                            
                                            if (word_list) {
                                                ((MAListWord*)object).word_list = word_list;
                                                word_list.maListWord = ((MAListWord*)object);
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_PHLISTWORD:   // PHListWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"ph_list_word_id"] == NSOrderedSame) {
                                            object = (PHListWord *)[phListWordDICT objectForKey:string];
                                            
                                            // NSLog(@"PHListWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_list_id"] == NSOrderedSame) {
                                            Word_List* word_list = [wordListDICT objectForKey:string];
                                            
                                            if (word_list) {
                                                ((PHListWord*)object).word_list = word_list;
                                                word_list.phListWord = ((PHListWord*)object);
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_GRERBLISTWORD:   // GRERBListWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"gre_list_word_id"] == NSOrderedSame) {
                                            object = (GRERBListWord *)[grerbListWordDICT objectForKey:string];
                                            
                                            // NSLog(@"GRERBListWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_list_id"] == NSOrderedSame) {
                                            Word_List* word_list = [wordListDICT objectForKey:string];
                                            
                                            if (word_list) {
                                                ((GRERBListWord*)object).word_list = word_list;
                                                word_list.grerbListWord = ((GRERBListWord*)object);
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_GRERBLISTMEM:   // GRERBListMem
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"gre_list_memory_id"] == NSOrderedSame) {
                                            object = (GRERBListMem *)[grerbListMemDICT objectForKey:string];
                                            
                                            // NSLog(@"GRERBListMem - id: %@", string);
                                        }
                                        else if ([attrString compare:@"gre_list_word_id"] == NSOrderedSame) {
                                            GRERBListWord* word = [grerbListWordDICT objectForKey:string];
                                            
                                            if (word) {
                                                ((GRERBListMem*)object).grerbListWord = word;
                                                [word.grerbListMem addObject:((GRERBListMem*)object)];
                                            }
                                        }
                                        
                                        break;
                                    }
                                    case TTABLEDATA_DOTALISTWORD:   // DotaListWord
                                    {
                                        if (!attrDict)
                                            break;
                                        
                                        attrString = [attrDict objectForKey:@"name"];
                                        
                                        if (!attrString)
                                            break;
                                        
                                        if ([attrString compare:@"dota_list_word_id"] == NSOrderedSame) {
                                            object = (CSListWord *)[csListWordDICT objectForKey:string];
                                            
                                            // NSLog(@"DotaListWord - id: %@", string);
                                        }
                                        else if ([attrString compare:@"word_list_id"] == NSOrderedSame) {
                                            Word_List* word_list = [wordListDICT objectForKey:string];
                                            
                                            if (word_list) {
                                                ((CSListWord*)object).word_list = word_list;
                                                word_list.dotaListWord = ((DotaListWord*)object);
                                            }
                                        }
                                        
                                        
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
                                            // NSLog(@"Conversion - id: %@", string);
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
                                            // NSLog(@"Derivation - id: %@", string);
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
                                            // NSLog(@"Synonym - id: %@", string);
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
                                            // NSLog(@"Antonym - id: %@", string);
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
            NSLog(@"association");
        }
        else if ([name compare:@"frequency"] == NSOrderedSame) {
            ist = TTABLEDATA_FREQUENCY;
            NSLog(@"frequency");
        }
        else if ([name compare:@"dota_list_word"] == NSOrderedSame) {
            ist = TTABLEDATA_DOTALISTWORD;
            NSLog(@"dota_list_word");
        }
        else if ([name compare:@"mcec_dict_meaning"] == NSOrderedSame) {
            ist = TTABLEDATA_MCECDICTMEANING;
            NSLog(@"mcec_dict_meaning");
        }
        else if ([name compare:@"mcec_dict_word"] == NSOrderedSame) {
            ist = TTABLEDATA_MCECDICTWORD;
            NSLog(@"mcec_dict_word");
        }
        else if ([name compare:@"mwc_dict_meaning"] == NSOrderedSame) {
            ist = TTABLEDATA_MWCDICTMEANING;
            NSLog(@"mwc_dict_meaning");
        }
        else if ([name compare:@"mwc_dict_word"] == NSOrderedSame) {
            ist = TTABLEDATA_MWCDICTWORD;
            NSLog(@"mwc_dict_word");
        }
        else if ([name compare:@"ahd_dict_meaning"] == NSOrderedSame) {
            ist = TTABLEDATA_AHDDICTMEANING;
            NSLog(@"ahd_dict_meaning");
        }
        else if ([name compare:@"ahd_dict_word"] == NSOrderedSame) {
            ist = TTABLEDATA_AHDDICTWORD;
            NSLog(@"ahd_dict_word");
        }
        else if ([name compare:@"ahd_dict_sentence"] == NSOrderedSame) {
            ist = TTABLEDATA_AHDDICTSENTENCE;
            NSLog(@"ahd_dict_sentence");
        }
        else if ([name compare:@"rootaffix"] == NSOrderedSame) {
            ist = TTABLEDATA_ROOTAFFIX;
            NSLog(@"rootaffix");
        }
        else if ([name compare:@"sense"] == NSOrderedSame) {
            ist = TTABLEDATA_SENSE;
            NSLog(@"sense");
        }
        else if ([name compare:@"sense_family"] == NSOrderedSame) {
            ist = TTABLEDATA_SENSEFAMILY;
            NSLog(@"sense_family");
        }
        else if ([name compare:@"word"] == NSOrderedSame) {
            ist = TTABLEDATA_WORD;
            NSLog(@"word");
        }
        else if ([name compare:@"word_association"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDASSOCIATION;
            NSLog(@"word_association");
        }
        else if ([name compare:@"word_dict"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDDICT;
            NSLog(@"word_dict");
        }
        else if ([name compare:@"word_list"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDLIST;
            NSLog(@"word_list");
        }
        else if ([name compare:@"cs_list_word"] == NSOrderedSame) {
            ist = TTABLEDATA_CSLISTWORD;
            NSLog(@"cs_list_word");
        }
        else if ([name compare:@"ma_list_word"] == NSOrderedSame) {
            ist = TTABLEDATA_MALISTWORD;
            NSLog(@"ma_list_word");
        }
        else if ([name compare:@"ph_list_word"] == NSOrderedSame) {
            ist = TTABLEDATA_PHLISTWORD;
            NSLog(@"ph_list_word");
        }
        else if ([name compare:@"gre_list_word"] == NSOrderedSame) {
            ist = TTABLEDATA_GRERBLISTWORD;
            NSLog(@"gre_list_word");
        }
        else if ([name compare:@"gre_list_memory"] == NSOrderedSame) {
            ist = TTABLEDATA_GRERBLISTMEM;
            NSLog(@"gre_list_mem");
        }
        else if ([name compare:@"dota_list_word"] == NSOrderedSame) {
            ist = TTABLEDATA_DOTALISTWORD;
            NSLog(@"dota_list_word");
        }
        else if ([name compare:@"word_rootaffix"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDROOTAFFIX;
            NSLog(@"word_rootaffix");
        }
        else if ([name compare:@"word_sense"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDSENSE;
            NSLog(@"word_sense");
        }
        else if ([name compare:@"word_conversion"] == NSOrderedSame) {
            ist = TTABLEDATA_CONVERSION;
            NSLog(@"word_conversion");
        }
        else if ([name compare:@"word_derivation"] == NSOrderedSame) {
            ist = TTABLEDATA_DERIVATION;
            NSLog(@"word_derivation");
        }
        else if ([name compare:@"synonym"] == NSOrderedSame) {
            ist = TTABLEDATA_SYNONYM;
            NSLog(@"synonym");
        }
        else if ([name compare:@"antonym"] == NSOrderedSame) {
            ist = TTABLEDATA_ANTONYM;
            NSLog(@"antonym");
        }
        else if ([name compare:@"list"] == NSOrderedSame) {
            ist = TTABLEDATA_LIST;
            NSLog(@"list");
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
