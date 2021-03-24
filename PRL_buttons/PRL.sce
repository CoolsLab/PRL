## Mieke van Holstein, Roshan Cools, Hanneke den Ouden: probabilistic reversal learning task (PRL). 
## Based on Cools et al. 2001, Swainson et al. 2000; Lawrence et al. 1999; den Ouden et al 2013.
## started: October 6th 2011 
## finished: November 26 2014
## Prompt format entered text: "subject_12_session_2".
## check: string ID_subject in INFO files
## includes 3 pcl files: PRL_buttons, a SUBS file and INFO file, and 2 .wav files.
## Output: 2 log files for each subject.  
##
## COUNTERBALANCING 
## This code counterbalances the stimuli of color between session 1 and session 2, 
## based on the subject number: even subjects get color 1 on day 1 and color 2 on day 2, and 
## odd subject numbers vice versa. 
## h.denouden@donders.ru.nl

scenario = "PRL"; pcl_file = "PRL.pcl";
no_logfile = false;
default_background_color = 0, 0, 0; # you can set the background color here. 0 0 0 = black
default_font = "Arial"; default_font_size = 25;
response_matching = simple_matching;   
response_logging = log_active;
active_buttons = 5; button_codes = 1,2,3,4,5;

# define the colors for the stimuli in 2 color versions
$color1 = "255,255,50"; 	## YELLOW
$color2 = "0,100,255"; 		## BLUE (DARK)
$color3 = "255,140,0";	## DARKORANGE 
$color4 = "209,71,224";	## PINK

begin;
############################# 	First define all elements	irrespective of location on screen ######################################
#line_graphic {coordinates = -160,-99, 160,-99, 160, 99, -160,99, -160,-101;line_width = 3;}ret_basic;		#center white;
line_graphic {coordinates = -160,-99, 160,-99, 160, 99, -160,99, -160,-101;line_width = 3; line_color = 0,255,0;}ret_correct; 	#center green
line_graphic {coordinates = -160,-99, 160,-99, 160, 99, -160,99, -160,-101;line_width = 3; line_color = 255,0,0;}ret_wrong; 	#center red

# Stimuli A B C D(take color from input above)
# horizontal stimuli
line_graphic {coordinates = -79,-60, 79, -60;coordinates = -79,-20, 79, -20;coordinates = -79,20, 79, 20;coordinates = -79,60, 79, 60;line_width = 25;line_color = $color1 ;}stimulusA;# yellow stimulus
line_graphic {coordinates = -79,-60, 79, -60;coordinates = -79,-20, 79, -20;coordinates = -79,20, 79, 20;coordinates = -79,60, 79, 60;line_width = 25;line_color = $color3 ;}stimulusC;# 

#### 1 SESSION VERSION:  use this when running the task only once for each subject: all vertical lines too
line_graphic {coordinates = -60,-79, -60, 79;coordinates = -20,-79, -20, 79;coordinates = 20,-79, 20, 79;coordinates = 60,-79, 60, 79;line_width = 25;line_color = $color2 ;}stimulusB;# 
line_graphic {coordinates = -60,-79, -60, 79;coordinates = -20,-79, -20, 79;coordinates = 20,-79, 20, 79;coordinates = 60,-79, 60, 79;line_width = 25;line_color = $color4 ;}stimulusD;# 

#### 2 SESSION VERSION: use this when running the task twice for each subject: all horizontal lines
#line_graphic {coordinates = -79,-60, 79, -60;coordinates = -79,-20, 79, -20;coordinates = -79,20, 79, 20;coordinates = -79,60, 79, 60;line_width = 25;line_color = $color2 ;}stimulusB;# blue stimulus
#line_graphic {coordinates = -79,-60, 79, -60;coordinates = -79,-20, 79, -20;coordinates = -79,20, 79, 20;coordinates = -79,60, 79, 60;line_width = 25;line_color = $color4 ;}stimulusD;# 

# Feedback: sound and text (Accompanied by change in retangle color).
text {caption = "fout";  font_color = 255,0,0; font_size = 35;}text_wrong;
sound {wavefile {filename= "wrong.wav"  ;};} sound_wrong;

text {caption = "goed"; font_color = 0,255,0; font_size = 35;}text_correct;
sound {wavefile {filename= "correct.wav";};} sound_correct;

# DEFINE BITMAP STIMULI HERE AS WELL AND PUT IN EXP FOLDER
bitmap { filename = "smiley.bmp"; } bmp1;
bitmap { filename = "cryey.bmp"; } bmp2;

# Other texts
text {caption = " "; font_size =1; font_color = 0,0,0;}text_ITI;# = black screen
text {caption = "Druk spatie om te beginnen..."; }text_START;
text {caption = "Goed gedaan! - De taak is nu afgelopen\n\n Wacht tot het scherm sluit."; }text_END;
text {caption = " "; }text_example;# = black screen

###########		Define basic picture which to add items to in PCL file	#############
picture {
text {caption = " "; } text_intro;
x=0; y=0;
} pic_intro;

# PUT 4 RETANGLES ON THE SCREEN. LATER PARTS ARE ADDED TO THIS PICTURE
picture {
	#line_graphic ret_basic; x=0;y=220;	#line_graphic ret_basic; x=330;y=0;#	line_graphic ret_basic; x=0;y=-220;#	line_graphic ret_basic; x=-330;y=0;	
	text text_example; x= 0; y=0;
}basic_pic;

trial {# picture parts are added to this picture in PCL (= stimuli)
   trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1; 
		stimulus_event {
		picture basic_pic;
		code = "0";  
	}event_basictrial;
}basic_trial_STIM;

trial {# ITI 
   trial_duration = 1000;
   stimulus_event {
			picture {text text_ITI; x = 0; y = 0;};
		code = "ITI"; 
	}event_ITI;
}ITI;

trial {# Presents text 
   trial_duration = forever;
   trial_type = specific_response;
   terminator_button =5; # button 5 = ENTER
stimulus_event{   
picture {text text_START;x=0;y=0;};
code = "start";
}event_START_trial;
}Trial_START;

trial {# Presents text: "Goed gedaan! De taak is nu afgelopen. Wacht tot het scherm sluit."
	trial_duration = 5000;
	stimulus_event {
			picture {text text_END; x=0; y=0;};
		code = "END"; 
	}event_END;
} trial_END;