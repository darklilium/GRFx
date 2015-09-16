Version 3.6 - Dec 19, 2013
* Recompiled for Flexviewer 3.6

Version 3.5 - Oct 8, 2013
* Recompiled for Flexviewer 3.5

Version 3.4 - July 25, 2013
* This version has no coding changes it just includes a compiled version for FlexViewer 3.4

Version 3.3 - May 6, 2013
* Recompiled for Flex Viewer 3.3

Version 3.2 - Mar 29, 2013
* Recompiled for Flex Viewer 3.2

Version 3.1 - Dec 17, 2012
* Recompiled for Flex Viewer 3.1

Version 3.0i - Sept 5, 2012
* Recompiled for Flex Viewer 3.0 with no locale specified

Version 3.0 - June 13, 2012
* Recompiled for Flex Viewer 3.0

 
README FIRST

    The Link Widget version 3.0 for FlexViewer 3.0 or higher is a widget that Simply allows Flex Viewer to have a link to a
website.

Look at the config-link.xml for an example of adding multiple links in a widget group.

Feature include:

    * Simply add as many LinkWidgets as you desire to the config.xml and specify a new LinkWidget_?.xml file for each site.
    * Simply add the websites url to the LinkWidget_?.xml
    * Add this widget as you would any other widget (in a widget group or by itself).

What's in the zip file:

*Uncompiled folder
	LinkWidget.mxml          	- This is the heart of the widget that handles the call to open a url.
	LinkWidget_esri.xml		- Sample XML configuration for opening esri's website.
	LinkWidget_FlexViewer.xml	- Sample XML configuration for opening esri's Flex Viewer website.
	assets.images			- Sample icon used for demo.
*compiled_FV3.0
	LinkWidget.swf          	- This is the heart of the widget that handles the call to open a url.
	LinkWidget_esri.xml		- Sample XML configuration for opening esri's website.
	LinkWidget_FlexViewer.xml	- Sample XML configuration for opening esri's Flex Viewer website.
	assets.images			- Sample icon used for demo.

ReadMe.txt			- This file.


Requirements:
- The ArcGIS Flex API 3.0 or greater swc. Download it here:  http://resources.esri.com/arcgisserver/apis/flex/index.cfm?fa=downloadDisclaimer
- Internet access to the ArcGIS Online servers
- Web Server to deploy the application
- Flash Player 11 or greater 

How to install:

To install using the compiled version just copy the folder called Link
under the Widgets folder, and add a line like this to your config.xml

       <widget label="Visit esri Website"
        	icon="widgets/Link/assets/images/esri.png"
        	config="widgets/Link/LinkWidget_esri.xml"
        	url="widgets/Link/LinkWidget.swf"/>


For the Uncompiled you need to copy the Link folder to src/widgets folder.

Finalize the install for Uncompiled version:
 - In Flex or Flash Builder on the left of the screen is the FlexNavigator/Package Explorer tree, right click you Flex Sample Viewer project
   and go to properties
 - In the Properties dialog choose Flex Compiler in the left window.
 - Ensure your Flex SDK Version is 4.6 or greater
 - If you are still using Flex Builder check Require Flash Player Version under HTML Wrapper and enter 10.0 or higher
 - Now click Flex Modules in the left window.
 - On the right hand side of the dialog will be an add buton click it
 - browse to src/com/esri/viewer/widgets/Link and select LinkWidget.mxml and click add.
 - click ok all the way out.


That’s it enjoy, if you have any comments or suggestions just post a comment on the code gallery.

Robert Scheitlin
GIS Manager
GIS Programmer
Calhoun County Commission
Alabama
