//
//  ViewController.m
//  First
//
//  Created by Eunice Saldivar on 6/24/15.
//  Copyright (c) 2015 jumpdigital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

{
    NSArray *names;
    NSArray *fullnames;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    names = [NSArray arrayWithObjects:@"Jelou", @"Chelsea", @"Clarisse", @"Jemee", @"Rizza", @"Mark", nil];
    fullnames = [NSArray arrayWithObjects:@"Jean Louise Tiston", @"Chelsea Estebat", @"Clarisse Fama", @"Jemme Ianna Allarde", @"Rizza Corella Punsalan", @"Mark Walter Fuentes", nil];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [names count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"TableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text = [names objectAtIndex:indexPath.row];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.tag = indexPath.row;
    button.frame = CGRectMake(250.0f, 10.0f, 75.0f, 30.0f);
    [button setTitle:@"View" forState:UIControlStateNormal];
    [cell addSubview:button];
    [button addTarget:self action:@selector(showMessage:) forControlEvents:UIControlEventTouchUpInside];
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
 
-(IBAction)showMessage:(id)sender
{
 //   NSInteger num = [sender tag];
    UIButton *senderButton = (UIButton *)sender;
    NSIndexPath *path = [NSIndexPath indexPathForRow:senderButton.tag inSection:0];
    NSString *notif = [fullnames objectAtIndex:path.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Full Name" message:[NSString stringWithFormat:@"%@", notif] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
}

@end
