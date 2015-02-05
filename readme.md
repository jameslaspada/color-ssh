color-ssh
=========
This little bash profile trick is to help you visually identify more quickly which tty session is ssh vs local.  


Prerequisites 
-------------
You must determine a theme profile to use with color-ssh command.

**_To choose an already existing theme profile_**

	Go to Terminal -> Preferences, then choose a profile that you wish to use for your ssh session. 
	Commit this to memory since this will be needed for configuration script execution ($SSH_THEME).


**_To create a new theme profile_**

	Go to Terminal -> Preferences. Click the '+' button under the Profiles selection box.
	Create a name for this profile, and select the properties you wish to use for this profile.  
	Commit this to memory since this will be needed for configuration script ($SSH_THEME).

Run Setup 
-------------
Execute the following curl command to configure color-ssh on your machine. Replace the argument variable $SSH_THEME with the theme name you picked under
the prerequisite steps. $DEFAULT_THEME should be the name of the theme you want to always use when you leave the ssh session. 

	$ curl -s https://raw.githubusercontent.com/jameslaspada/color-ssh/master/color-ssh-setup.sh | bash /dev/stdin $SSH_THEME $DEFAULT_THEME


