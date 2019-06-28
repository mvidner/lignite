# typed: true
# This file is generated from its .erb template. DO NOT EDIT.

module Lignite
  # Number of output ports in the system
  OUTPUTS = 4

  # Number of input  ports in the system
  INPUTS = 4

  # Number of buttons in the system
  BUTTONS = 6

  # Number of LEDs in the system
  LEDS = 4

  # LCD horizontal pixels
  LCD_WIDTH = 178

  # LCD vertical pixels
  LCD_HEIGHT = 128

  # Top line vertical pixels
  TOPLINE_HEIGHT = 10

  # Store levels
  LCD_STORE_LEVELS = 3

  DEFAULT_VOLUME = 100

  DEFAULT_SLEEPMINUTES = 30

  # Forground color
  FG_COLOR = 1

  # Background color
  BG_COLOR = 0

  # Number of bricks in the USB daisy chain (master + slaves)
  CHAIN_DEPT = 4

  # Max path size excluding trailing forward slash including zero termination
  PATHSIZE = 84

  # Max name size including zero termination (must be divideable by 4)
  NAMESIZE = 32

  # Max extension size including dot and zero termination
  EXTSIZE = 5

  # Max filename size including path, name, extension and termination (must be divideable by 4)
  FILENAMESIZE = 120

  # Max WIFI MAC size including zero termination
  MACSIZE = 18

  # Max WIFI IP size including zero termination
  IPSIZE = 16

  # Max bluetooth address size including zero termination
  BTADRSIZE = 13

  # Inclusive zero termination
  ERR_STRING_SIZE = 32

  EVENT_NONE = 0

  EVENT_BT_PIN = 1

  EVENT_BT_REQ_CONF = 2

  # Highest valid device type
  MAX_VALID_TYPE = 101

  # Folder for non volatile user programs/data
  MEMORY_FOLDER = "/mnt/ramdisk".freeze

  # Folder for On Brick Programming programs
  PROGRAM_FOLDER = "../prjs/BrkProg_SAVE".freeze

  # Folder for On Brick Data log files
  DATALOG_FOLDER = "../prjs/BrkDL_SAVE".freeze

  # Folder for SD card mount
  SDCARD_FOLDER = "../prjs/SD_Card".freeze

  # Folder for USB stick mount
  USBSTICK_FOLDER = "../prjs/USB_Stick".freeze

  # Project folder
  PRJS_DIR = "../prjs".freeze

  # Apps folder
  APPS_DIR = "../apps".freeze

  # Tools folder
  TOOLS_DIR = "../tools".freeze

  # Temporary folder
  TMP_DIR = "../tmp".freeze

  # Folder for non volatile settings
  SETTINGS_DIR = "../sys/settings".freeze

  # Max directory items allocated including "." and ".."
  DIR_DEEPT = 127

  # Last run filename
  LASTRUN_FILE_NAME = "lastrun".freeze

  # Calibration data filename
  CALDATA_FILE_NAME = "caldata".freeze

  # File used in "Sleep" app to save status
  SLEEP_FILE_NAME = "Sleep".freeze

  # File used in "Volume" app to save status
  VOLUME_FILE_NAME = "Volume".freeze

  # File used in "WiFi" app to save status
  WIFI_FILE_NAME = "WiFi".freeze

  # File used in "Bluetooth" app to save status
  BLUETOOTH_FILE_NAME = "Bluetooth".freeze

  # Robot Sound File
  EXT_SOUND = ".rsf".freeze

  # Robot Graphics File
  EXT_GRAPHICS = ".rgf".freeze

  # Robot Byte code File
  EXT_BYTECODE = ".rbf".freeze

  # Robot Text File
  EXT_TEXT = ".rtf".freeze

  # Robot Datalog File
  EXT_DATALOG = ".rdf".freeze

  # Robot Program File
  EXT_PROGRAM = ".rpf".freeze

  # Robot Configuration File
  EXT_CONFIG = ".rcf".freeze

  # Robot Archive File
  EXT_ARCHIVE = ".raf".freeze

  # Brick name maximal size (including zero termination)
  BRICKNAMESIZE = 120

  # Bluetooth pass key size (including zero termination)
  BTPASSKEYSIZE = 7

  # WiFi pass key size (including zero termination)
  WIFIPASSKEYSIZE = 33

  # Character set allowed in brick name and raw filenames
  CHARSET_NAME = 1

  # Character set allowed in file names
  CHARSET_FILENAME = 2

  # Character set allowed in bluetooth pass key
  CHARSET_BTPASSKEY = 4

  # Character set allowed in WiFi pass key
  CHARSET_WIFIPASSKEY = 8

  # Character set allowed in WiFi ssid
  CHARSET_WIFISSID = 16

  # DATA8  negative limit
  DATA8_MIN = -127

  # DATA8  positive limit
  DATA8_MAX = 127

  # DATA16 negative limit
  DATA16_MIN = -32767

  # DATA16 positive limit
  DATA16_MAX = 32767

  # DATA32 negative limit
  DATA32_MIN = -2147483647

  # DATA32 positive limit
  DATA32_MAX = 2147483647

  # DATAF  negative limit
  DATAF_MIN = -2147483647

  # DATAF  positive limit
  DATAF_MAX = 2147483647

  DATA8_NAN = 128

  DATA16_NAN = 32768

  DATA32_NAN = 2147483648

  DATAF_NAN = 2143289344

  PULSE_GUI_BACKGROUND = 1

  PULSE_BROWSER = 2

  PULSE_KEY = 4

  POP3_ABS_X = 16

  POP3_ABS_Y = 50

  POP3_ABS_WARN_ICON_X = 64

  POP3_ABS_WARN_ICON_X1 = 40

  POP3_ABS_WARN_ICON_X2 = 72

  POP3_ABS_WARN_ICON_X3 = 104

  POP3_ABS_WARN_ICON_Y = 60

  POP3_ABS_WARN_SPEC_ICON_X = 88

  POP3_ABS_WARN_SPEC_ICON_Y = 60

  POP3_ABS_WARN_TEXT_X = 80

  POP3_ABS_WARN_TEXT_Y = 68

  POP3_ABS_WARN_YES_X = 72

  POP3_ABS_WARN_YES_Y = 90

  POP3_ABS_WARN_LINE_X = 21

  POP3_ABS_WARN_LINE_Y = 89

  POP3_ABS_WARN_LINE_ENDX = 155

  # .
end
