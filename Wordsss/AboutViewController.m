//
//  AboutViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 3/4/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)lastStep
{
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)patentButtonClicked:(id)sender
{
    PatentViewController* pvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PatentViewController"];
    
    [[self navigationController] pushViewController:pvc animated:YES];
}

- (IBAction)shareButtonClicked:(id)sender
{
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"短信分享", @"邮件分享", nil];
    UITabBar* tabBar = ((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController).tabBar;
    [actionSheet showFromTabBar:tabBar];
}

- (IBAction)feedbackButtonClicked:(id)sender
{
    if (![MFMailComposeViewController canSendMail]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"未设置邮件帐户", nil)
                                                        message:NSLocalizedString(@"可以在Mail中添加您的邮件帐户", nil)
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"好", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }
    else {
        MFMailComposeViewController* picker = [[MFMailComposeViewController alloc] init];
        picker.mailComposeDelegate = self;
        picker.modalPresentationStyle = UIModalPresentationPageSheet;
        
        NSString *subject = [NSString stringWithFormat:@"迅辞用户反馈"];
        
        NSString *receiver = [NSString stringWithFormat:@"renkelvin@gmail.com"];
        [picker setToRecipients:[NSArray arrayWithObject:receiver]];
        
        [picker setSubject:subject];
        NSString *emailBody = [NSString stringWithFormat:@"反馈类型（功能建议 / 程序漏洞）：\n\n描述："];
        [picker setMessageBody:emailBody isHTML:NO];
        
        [((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController) presentModalViewController:picker animated:YES];
    }
}

- (IBAction)rateButtonClicked:(id)sender
{
    NSString* appid = [NSString stringWithFormat:@"507861904"];
    NSString* url = [NSString stringWithFormat:  @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=1&type=Purple+Software&mt=8", appid];
    
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
}

#pragma mark - Instance methods

- (void)shareByMessage
{
    if (![MFMessageComposeViewController canSendText]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"无法发送信息", nil)
                                                        message:NSLocalizedString(@"可", nil)
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"好", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }
    else {
        MFMessageComposeViewController* picker = [[MFMessageComposeViewController alloc] init];
        picker.messageComposeDelegate = self;
        
        NSString *body = [NSString stringWithFormat:@"推荐你使用迅辞记忆单词。迅辞是先进而简明的智能词汇记忆助理, 拥有前所未有的交互式算法和优雅易用设计。在 App Store 搜索“迅辞”即可下载至 iOS 设备。"];
        [picker setBody:body];
        [((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController) presentModalViewController:picker animated:YES];
    }
}

- (void)shareByMail
{
    if (![MFMailComposeViewController canSendMail]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"未设置邮件帐户", nil)
                                                        message:NSLocalizedString(@"可以在Mail中添加您的邮件帐户", nil)
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"好", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }
    else {
        MFMailComposeViewController* picker = [[MFMailComposeViewController alloc] init];
        picker.mailComposeDelegate = self;
        picker.modalPresentationStyle = UIModalPresentationPageSheet;
        NSString *subject = [NSString stringWithFormat:@"推荐你使用迅辞记忆单词"];
        [picker setSubject:subject];
        NSString *emailBody = [NSString stringWithFormat:@"迅辞是先进而简明的智能词汇记忆助理, 拥有前所未有的交互式算法和优雅易用设计。在 App Store 搜索“迅辞”即可下载至 iOS 设备。"];
        [picker setMessageBody:emailBody isHTML:NO];
        [((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController) presentModalViewController:picker animated:YES];
    }
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController*)controller 
          didFinishWithResult:(MFMailComposeResult)result 
                        error:(NSError*)error
{
    NSString *message = nil;
    switch (result)
    {
        case MFMailComposeResultCancelled: {
            message = NSLocalizedString(@"发送取消", nil);
            [((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController) dismissModalViewControllerAnimated:YES];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message 
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
            [alertView show];
            break;
        }
        case MFMailComposeResultSaved: {
            message = NSLocalizedString(@"保存成功", nil);
            [((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController) dismissModalViewControllerAnimated:YES];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message 
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
            [alertView show];
            break;
        }
        case MFMailComposeResultSent: {
            message = NSLocalizedString(@"发送成功", nil);
            [((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController) dismissModalViewControllerAnimated:YES];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message 
                                                                message:NSLocalizedString(@"感谢您使用迅辞！", nil)
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
            [alertView show];
            break;
        }
        case MFMailComposeResultFailed: {
            message = NSLocalizedString(@"发送失败", nil);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message 
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
            [alertView show];
            break;
        }
        default: {
            return;
        }
    }
}

#pragma mark - MFMessageComposeViewControllerDelegate

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller 
                 didFinishWithResult:(MessageComposeResult)result
{
    NSString *message = nil;
    switch (result)
    {
        case MessageComposeResultCancelled: {
            message = NSLocalizedString(@"您已取消发送", nil);
            [((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController) dismissModalViewControllerAnimated:YES];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message 
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
            [alertView show];
            break;
        }
        case MessageComposeResultSent: {
            message = NSLocalizedString(@"发送成功", nil);
            [((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController) dismissModalViewControllerAnimated:YES];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message 
                                                                message:NSLocalizedString(@"感谢您使用迅辞！", nil)
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
            [alertView show];
            break;
        }
        case MessageComposeResultFailed: {
            message = NSLocalizedString(@"发送失败", nil);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message 
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
            [alertView show];
            break;
        }
        default: {
            return;
        }
    }
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            [self shareByMessage];
            
            break;
        }
        case 1:
        {
            [self shareByMail];
            
            break;
        }
        default:
            break;
    }
}

@end
