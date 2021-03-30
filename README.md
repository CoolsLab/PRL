# PRL
Probabilistic reversal learning task (presentation)
Probabilistic reversal learning – Presentation User manual
 
Decisions to make before starting
There are a number of issues that need to be decided upon and updated in the code. If you want to edit the code, you need to open the .exp file, and from within Presentation select the files that have the correct path and open them in the editor

1.	Feedback contingencies: 
80% or 70% reward for correct choice, (for normal healthy populations we recommend 70% to avoid ceiling effects). 
You can alter this in the PRL_INFO.pcl file by commenting out (using ##) the non-desired contingencies
2.	Feedback  modality
Emoticons versus 'correct' en 'incorrect' (former not recommended in populations with altered face/ social cue processing). 
This is set in PRL_INFO.pcl:
for text feedback, set: 	int imagefeedback = 0; 
for image feedbac, set: 	int imagefeedback = 1;
3.	Number of testing sessions
If subjects are tested once, everyone will receive the same stimuli (blue vertical and yellow horizontal stripes). However, if subjects are tested twice, the order of the stimulus colour is counterbalanced, and they are now always horizontal. This is to avoid any carry-over biases from session 1 to session 2. 
Make sure that in PRL.sce (around line 40) and PRL_SUBS.pcl (around line 10)  the required version is uncommented. 


Assuming people are tested twice, there are two versions of the PRL task:  
o  version 1 with blue and yellow patterns  
o  version 2 with orange and dark pink patterns 
All subjects are tested during two sessions, and they will do the assessment once with each color combination. Which version each subject receives on each session is counterbalanced, and determined beforehand, based on the subject number: even subjects get color 1 on day 1 and color 2 on day 2, and odd subject numbers vice versa.

Response buttons:
People respond using 4 buttons, currently set to the 8, 6, 4, 2 en 4 of the numerical keyboard, for up/right/down/left, which is fairly intuitive. Should you want to change this, then load the task in Presentation and then look under Settings – Response. There you can set which buttons you want to use under ‘active buttons’. ENTER has to be one of the buttons, and the number (order of the button list) should stay the same. 

 
Running the PRL task 
o  Run the task from the Main menu by selecting the PRL.sce file (red arrow), then click “
Run ” blue arrow)

 

Subject ID screen appears in which you enter the subject number and session 
o  The task is programmed to select the numbers after the 1st and 3rd  underscores 
You should always enter the subject details as:  subject_#_session_#

After you entered the subject details in the ID prompt, you click OK and then Run Scenario
 (see red arrow below)

 

Presentation will now switch to full-screen mode and the word Ready… appears.  
o  After you press ENTER the instructions for the subject will appear  
o  One instruction screen informing them about patterns, followed by 
o  an example of what the patterns and screen will look like, and 
o  two instruction screens of what their task is. 
o  This instruction should be sufficient for the subject to perform the task 
o  If both you and the subject are confident the task is clear, you may press ENTER to begin

The words ‘Druk spatie om te beginnen’ appear and after you press SPACE BAR the task will start 
 
o  At the end of the task, the text Goed gedaan! De taak is nu afgelopen. Wacht tot het scherm sluit."
 will be shown for 5 seconds after which the Full Screen mode is exited and the Presentation window is visible again.  
o  You will see the previous Presentation screen and an Analysis screen. Press ‘continue’ and then ‘finish’. You can now close presentation. 

At the end of a testing session, make sure to save the two output files for each session:
- PRL_subject_#_session_#_DATE_TIME.log : this one is the custom-made output file
- subject_#_session_#-PRL.log: this one is the standard presentation log file (serves as backup)

DO NOT press ESCAPE while the task is running unless  you want to restart the task and do not want to use the data from this subject. 


## Citation

If you intend to publish results obtained with this code, cite it as follows:

- CoolsLab. (2021, March 30). CoolsLab/PRL: Probabilistic Reversal Learning task (DUTCH) (Version v0.1.0). Zenodo. http://doi.org/10.5281/zenodo.4647056

## Version

Version 0.1 - March 2021

## Contact

E-mail: roshan.cools@donders.ru.nl
