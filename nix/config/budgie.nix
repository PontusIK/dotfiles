{ ... }:

{

	# Enable the X11 windowing system.
	services.xserver= {
	  enable = true;
	  displayManager.lightdm.enable = true;
	  desktopManager.budgie.enable = true;
	  xkb = {
	  layout = "se";
	  variant = "";
    };
  };

}
