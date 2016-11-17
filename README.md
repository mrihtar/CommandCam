## CommandCam

The original author of **CommandCam** is [Ted Burke]. This repository is a
fork of [tedburke/CommandCam] and contains an enhanced version of the original.
CommandCam is published under the [GNU General Public License (version 3)]
and is completely free to download and use. You can download the precompiled
version of **CommandCam** for Windows along with source code from here:
[CommandCam-2.7.zip]

### Features

**CommandCam** is a simple and easy to use command line webcam image grabber
for Windows. It captures a single image from a webcam and stores it in a local
file. **CommandCam** is ideal for use in batch files and other situations
where you want a very simple way to automate image capture. **CommandCam**
uses Microsoft's DirectShow API to access webcams, so it should work with most
USB cameras.

Currently it can capture and decode the following image formats from webcams:  
- RGB 24 bits (RGB888)
- YUY2 16 bits (4:2:2)
- I420 12 bits (4:2:0 planar)
- MJPG 24 bits

To check which format your webcam uses, use the */details* option.

You can select which webcam to use (by number or by name), which resolution to
use and which format to select (if there are more). For the YUV image formats
(YUY2, I420, ...) you can also select the color conversion parameters according
to the ITU-R recommendation (BT.601 or BT.709). For more on this see
[Video Rendering with 8-Bit YUV Formats] from Microsoft and [Wikipedia:YUV].

### Usage

CommandCam doesn't have any GUI and is intended for use in a command line
window or in batch files. You can open command line window by running **cmd**
or via *Start* &gt; *Accessories* &gt; **Command Prompt**. Move to the directory
where you downloaded *CommandCam.exe* (for example, *My Documents\Downloads*),
type ```CommandCam``` and if the webcam is connected, the image will be captured
and stored in the file *capture.bmp* on the same directory.

You can specify the following options to the **CommandCam**:  
- **/delay &lt;DELAY_IN_MILLISECONDS&gt;**  
  Specify a time delay between the camera being turned on and the image being 
  grabbed (recommended!).  
  Default: 2000 ms (2 s)

- **/filename &lt;OUTPUT_FILENAME&gt;**  
  Specify different filename for the grabbed image. If the filename contains
  spaces, enclose it in quotes. Filename currently shouldn't contain any
  Unicode characters.  
  Default: capture.bmp (for RGB) or capture.jpg (for MJPG)

- **/devnum &lt;DEVICE_NUMBER&gt;**  
  If you want to use a particular webcam (if you have more than one), check
  it's number with */devlist* and use it with */devnum*.  
  Default: 1<sup>st</sup> in list

- **/devname &lt;DEVICE_NAME&gt;**  
  Same as above, but with the full webcam name (as printed in */devlist*).

- **/size &lt;WIDTH&gt;x&lt;HEIGHT&gt;**  
  If the default resolution of captured image is not what you wanted, use
  */details* and select one of the supported resolutions listed for selected
  webcam.  
  Default: 1<sup>st</sup> in list

- **/fourcc &lt;FOURCC&gt;**  
  If your webcam supports more than one image format at the same resolutions,
  you can select specific format as listed in */details*. Typical formats would
  be RGB (best quality), YUY2 (less than RGB), I420 (less than YUY2) and MJPG
  (less than all above).  
  Default: RGB, for more about this see [What is FOURCC?] and [YUV pixel formats]

- **/colors &lt;BT.601 | BT.709&gt;**  
  Specifying this is meaningful only if your webcam outputs one of the YUV
  image formats (YUY2, I420, ...). BT.601 is the older color conversion (for
  SDTV, still very common) and BT.709 is newer (for HDTV). The difference is
  minimal.  
  Default: BT.601

- **/preview**  
  By default, CommandCam does not display any video on the screen before
  capturing the image. However, you can enable a short (1 s) video preview
  window using the */preview* option.

- **/devlist**  
  To list the available capture devices, for example to check which device
  number corresponds to which device, use the */devlist* option.  
  Example output:  
<pre>
Available capture devices:
&nbsp;&nbsp;&#x31;. Logitech QuickCam Connect
&nbsp;&nbsp;&#x32;. UScreenCapture
</pre>

- **/details**  
  This option lists all available capture devices along with their "pins" and
  capabilities:  
  - video format, [fourcc code], color depth in bits, resolution in
    pixels and frame rate/second

  Typical "pins" for the webcam would be:  
  - "Capture", "Still" and "Video Camera Terminal" (unusable)  

  Example output:  
<pre>
Available capture devices:
&nbsp;&nbsp;&#x31;. Logitech QuickCam Connect
&nbsp;&nbsp;   Pin: Capture, 9 caps
&nbsp;&nbsp;     Cap  0: FORMAT_VideoInfo, RGB, 24 bits, 160x120 @ 30 fps
&nbsp;&nbsp;     Cap  1: FORMAT_VideoInfo, RGB, 24 bits, 320x240 @ 15 fps
&nbsp;&nbsp;     Cap  2: FORMAT_VideoInfo, RGB, 24 bits, 640x480 @ 15 fps
&nbsp;&nbsp;     Cap  3: FORMAT_VideoInfo, RGB, 24 bits, 960x720 @ 7 fps
&nbsp;&nbsp;     Cap  4: FORMAT_VideoInfo, I420, 12 bits, 160x120 @ 30 fps
&nbsp;&nbsp;     Cap  5: FORMAT_VideoInfo, I420, 12 bits, 320x240 @ 15 fps
&nbsp;&nbsp;     Cap  6: FORMAT_VideoInfo, I420, 12 bits, 640x480 @ 15 fps
&nbsp;&nbsp;     Cap  7: FORMAT_VideoInfo, I420, 12 bits, 960x720 @ 7 fps
&nbsp;&nbsp;   Pin: Video Camera Terminal
&nbsp;&nbsp;   Pin: Still, 9 caps
&nbsp;&nbsp;     Cap  0: FORMAT_VideoInfo, RGB, 24 bits, 160x120 @ 1 fps
&nbsp;&nbsp;     Cap  1: FORMAT_VideoInfo, RGB, 24 bits, 320x240 @ 1 fps
&nbsp;&nbsp;     Cap  2: FORMAT_VideoInfo, RGB, 24 bits, 640x480 @ 1 fps
&nbsp;&nbsp;     Cap  3: FORMAT_VideoInfo, RGB, 24 bits, 960x720 @ 1 fps
&nbsp;&nbsp;     Cap  4: FORMAT_VideoInfo, I420, 12 bits, 160x120 @ 1 fps
&nbsp;&nbsp;     Cap  5: FORMAT_VideoInfo, I420, 12 bits, 320x240 @ 1 fps
&nbsp;&nbsp;     Cap  6: FORMAT_VideoInfo, I420, 12 bits, 640x480 @ 1 fps
&nbsp;&nbsp;     Cap  7: FORMAT_VideoInfo, I420, 12 bits, 960x720 @ 1 fps
&nbsp;&nbsp;&#x32;. UScreenCapture
&nbsp;&nbsp;   Pin: Capture, 1 caps
&nbsp;&nbsp;     Cap  0: FORMAT_VideoInfo, RGB, 24 bits, 1920x1080 @ 15 fps
</pre>

- **/quiet**  
  To suppress the text normally printed to the console by CommandCam
  (version and progress information), use the */quiet* option. Error
  messages will still be printed to the screen.

### How to compile

**CommandCam** can be compiled with Microsoft C++ or MinGW g++ using supplied
Makefiles or directly:

- Microsoft C++  
  ```cl CommandCam.cpp ole32.lib strmiids.lib oleaut32.lib```
- MinGW g++  
  ```g++ CommandCam.cpp -lole32 -lstrmiids -loleaut32 -static -o CommandCam.exe```

[Ted Burke]: https://batchloaf.wordpress.com/commandcam/
[tedburke/CommandCam]: https://github.com/tedburke/CommandCam
[GNU General Public License (version 3)]: https://www.gnu.org/licenses/gpl.txt
[Video Rendering with 8-Bit YUV Formats]: https://msdn.microsoft.com/en-us/library/aa904813(VS.80).aspx
[Wikipedia:YUV]: https://en.wikipedia.org/wiki/YUV
[What is FOURCC?]: http://www.fourcc.org/fourcc.php
[YUV pixel formats]: https://www.fourcc.org/yuv.php
[fourcc code]: http://www.fourcc.org/fourcc.php
[CommandCam-2.7.zip]: https://app.box.com/s/gbeqxo1hpe3hm5jmv7l96oxje3vd0zbv
