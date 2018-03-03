# This file is generated from its .erb template. DO NOT EDIT.

module Lignite
  # enum: TYPE
  # Type values for byte codes

  # Mode value that won't change mode in byte codes (convenient place to define)
  MODE_KEEP = -1

  # Type value that won't change type in byte codes
  TYPE_KEEP = 0

  # Device is NXT touch sensor
  TYPE_NXT_TOUCH = 1

  # Device is NXT light sensor
  TYPE_NXT_LIGHT = 2

  # Device is NXT sound sensor
  TYPE_NXT_SOUND = 3

  # Device is NXT color sensor
  TYPE_NXT_COLOR = 4

  # Device is NXT ultra sonic sensor
  TYPE_NXT_ULTRASONIC = 5

  # Device is NXT temperature sensor
  TYPE_NXT_TEMPERATURE = 6

  # Device is EV3/NXT tacho motor
  TYPE_TACHO = 7

  # Device is EV3 mini tacho motor
  TYPE_MINITACHO = 8

  # Device is EV3 new tacho motor
  TYPE_NEWTACHO = 9

  # Device is EV3 touch sensor
  TYPE_TOUCH = 16

  # Device is EV3 color sensor
  TYPE_COLOR = 29

  # Device is EV3 ultra sonic sensor
  TYPE_ULTRASONIC = 30

  # Device is EV3 gyro sensor
  TYPE_GYRO = 32

  # Device is EV3 IR sensor
  TYPE_IR = 33

  TYPE_THIRD_PARTY_START = 50

  TYPE_THIRD_PARTY_END = 98

  # Device is energy meter
  TYPE_ENERGYMETER = 99

  # Device type is not known yet
  TYPE_IIC_UNKNOWN = 100

  # Device is a NXT ADC test sensor
  TYPE_NXT_TEST = 101

  # Device is NXT IIC sensor
  TYPE_NXT_IIC = 123

  # Port is connected to a terminal
  TYPE_TERMINAL = 124

  # Port not empty but type has not been determined
  TYPE_UNKNOWN = 125

  # Port empty or not available
  TYPE_NONE = 126

  # Port not empty and type is invalid
  TYPE_ERROR = 127


  # enum: SLOT
  # Program ID's (Slots)

  # Program slot reserved for executing the user interface
  GUI_SLOT = 0

  # Program slot used to execute user projects, apps and tools
  USER_SLOT = 1

  # Program slot used for direct commands coming from c_com
  CMD_SLOT = 2

  # Program slot used for direct commands coming from c_ui
  TERM_SLOT = 3

  # Program slot used to run the debug ui
  DEBUG_SLOT = 4

  # Maximum slots supported by the VM
  SLOTS = 5

  CURRENT_SLOT = -1


  # enum: BUTTONTYPE
  # Button

  NO_BUTTON = 0

  UP_BUTTON = 1

  ENTER_BUTTON = 2

  DOWN_BUTTON = 3

  RIGHT_BUTTON = 4

  LEFT_BUTTON = 5

  BACK_BUTTON = 6

  ANY_BUTTON = 7

  BUTTONTYPES = 8


  # enum: BROWSERTYPE
  # Browser Types Avaliable

  # Browser for folders
  BROWSE_FOLDERS = 0

  # Browser for folders and files
  BROWSE_FOLDS_FILES = 1

  # Browser for cached / recent files
  BROWSE_CACHE = 2

  # Browser for files
  BROWSE_FILES = 3

  # Maximum browser types supported by the VM
  BROWSERTYPES = 4


  # enum: FONTTYPE
  # Font Types Avaliable

  NORMAL_FONT = 0

  SMALL_FONT = 1

  LARGE_FONT = 2

  TINY_FONT = 3

  # Maximum font types supported by the VM
  FONTTYPES = 4


  # enum: ICONTYPE
  # Icon Types Avaliable

  # 24x12_Files_Folders_Settings.bmp
  NORMAL_ICON = 0

  SMALL_ICON = 1

  # 24x22_Yes_No_OFF_FILEOps.bmp
  LARGE_ICON = 2

  MENU_ICON = 3

  # 8x12_miniArrows.bmp
  ARROW_ICON = 4

  # Maximum icon types supported by the VM
  ICONTYPES = 5


  # enum: S_ICON_NO

  SICON_CHARGING = 0

  SICON_BATT_4 = 1

  SICON_BATT_3 = 2

  SICON_BATT_2 = 3

  SICON_BATT_1 = 4

  SICON_BATT_0 = 5

  SICON_WAIT1 = 6

  SICON_WAIT2 = 7

  SICON_BT_ON = 8

  SICON_BT_VISIBLE = 9

  SICON_BT_CONNECTED = 10

  SICON_BT_CONNVISIB = 11

  SICON_WIFI_3 = 12

  SICON_WIFI_2 = 13

  SICON_WIFI_1 = 14

  SICON_WIFI_CONNECTED = 15

  SICON_USB = 21

  S_ICON_NOS = 22


  # enum: N_ICON_NO

  ICON_NONE = -1

  ICON_RUN = 0

  ICON_FOLDER = 1

  ICON_FOLDER2 = 2

  ICON_USB = 3

  ICON_SD = 4

  ICON_SOUND = 5

  ICON_IMAGE = 6

  ICON_SETTINGS = 7

  ICON_ONOFF = 8

  ICON_SEARCH = 9

  ICON_WIFI = 10

  ICON_CONNECTIONS = 11

  ICON_ADD_HIDDEN = 12

  ICON_TRASHBIN = 13

  ICON_VISIBILITY = 14

  ICON_KEY = 15

  ICON_CONNECT = 16

  ICON_DISCONNECT = 17

  ICON_UP = 18

  ICON_DOWN = 19

  ICON_WAIT1 = 20

  ICON_WAIT2 = 21

  ICON_BLUETOOTH = 22

  ICON_INFO = 23

  ICON_TEXT = 24

  ICON_QUESTIONMARK = 27

  ICON_INFO_FILE = 28

  ICON_DISC = 29

  ICON_CONNECTED = 30

  ICON_OBP = 31

  ICON_OBD = 32

  ICON_OPENFOLDER = 33

  ICON_BRICK1 = 34

  N_ICON_NOS = 35


  # enum: L_ICON_NO

  YES_NOTSEL = 0

  YES_SEL = 1

  NO_NOTSEL = 2

  NO_SEL = 3

  OFF = 4

  WAIT_VERT = 5

  WAIT_HORZ = 6

  TO_MANUAL = 7

  WARNSIGN = 8

  WARN_BATT = 9

  WARN_POWER = 10

  WARN_TEMP = 11

  NO_USBSTICK = 12

  TO_EXECUTE = 13

  TO_BRICK = 14

  TO_SDCARD = 15

  TO_USBSTICK = 16

  TO_BLUETOOTH = 17

  TO_WIFI = 18

  TO_TRASH = 19

  TO_COPY = 20

  TO_FILE = 21

  CHAR_ERROR = 22

  COPY_ERROR = 23

  PROGRAM_ERROR = 24

  WARN_MEMORY = 27

  L_ICON_NOS = 28


  # enum: M_ICON_NO

  ICON_STAR = 0

  ICON_LOCKSTAR = 1

  ICON_LOCK = 2

  # Bluetooth type PC
  ICON_PC = 3

  # Bluetooth type PHONE
  ICON_PHONE = 4

  # Bluetooth type BRICK
  ICON_BRICK = 5

  # Bluetooth type UNKNOWN
  ICON_UNKNOWN = 6

  ICON_FROM_FOLDER = 7

  ICON_CHECKBOX = 8

  ICON_CHECKED = 9

  ICON_XED = 10

  M_ICON_NOS = 11


  # enum: A_ICON_NO

  ICON_LEFT = 1

  ICON_RIGHT = 2

  A_ICON_NOS = 3


  # enum: BTTYPE
  # Bluetooth Device Types

  # Bluetooth type PC
  BTTYPE_PC = 3

  # Bluetooth type PHONE
  BTTYPE_PHONE = 4

  # Bluetooth type BRICK
  BTTYPE_BRICK = 5

  # Bluetooth type UNKNOWN
  BTTYPE_UNKNOWN = 6

  BTTYPES = 7


  # enum: LEDPATTERN
  # LED Pattern

  LED_BLACK = 0

  LED_GREEN = 1

  LED_RED = 2

  LED_ORANGE = 3

  LED_GREEN_FLASH = 4

  LED_RED_FLASH = 5

  LED_ORANGE_FLASH = 6

  LED_GREEN_PULSE = 7

  LED_RED_PULSE = 8

  LED_ORANGE_PULSE = 9

  LEDPATTERNS = 10


  # enum: LEDTYPE

  # All LEDs
  LED_ALL = 0

  # Right red
  LED_RR = 1

  # Right green
  LED_RG = 2

  # Left red
  LED_LR = 3

  # Left green
  LED_LG = 4


  # enum: FILETYPE
  # File Types Avaliable

  FILETYPE_UNKNOWN = 0

  TYPE_FOLDER = 1

  TYPE_SOUND = 2

  TYPE_BYTECODE = 3

  TYPE_GRAPHICS = 4

  TYPE_DATALOG = 5

  TYPE_PROGRAM = 6

  TYPE_TEXT = 7

  TYPE_SDCARD = 16

  TYPE_USBSTICK = 32

  FILETYPES = 33

  TYPE_RESTART_BROWSER = -1

  TYPE_REFRESH_BROWSER = -2


  # enum: RESULT
  # Describes result from executing functions

  # No errors to report
  OK = 0

  # Busy - try again
  BUSY = 1

  # Something failed
  FAIL = 2

  # Stopped
  STOP = 4

  # Start
  START = 8


  # enum: DATA_FORMAT
  # Data formats used in device type formats

  # DATA8
  DATA_8 = 0

  # DATA16
  DATA_16 = 1

  # DATA32
  DATA_32 = 2

  # DATAF
  DATA_F = 3

  # Zero terminated string
  DATA_S = 4

  # Array handle
  DATA_A = 5

  # Variable type
  DATA_V = 7

  # Percent
  DATA_PCT = 16

  # Raw
  DATA_RAW = 18

  # SI unit
  DATA_SI = 19

  DATA_FORMATS = 20


  # enum: DEL
  # Delimiter codes used to define how data is separated in files

  # No delimiter at all
  DEL_NONE = 0

  # Use tab as delimiter
  DEL_TAB = 1

  # Use space as delimiter
  DEL_SPACE = 2

  # Use return as delimiter
  DEL_RETURN = 3

  # Use colon as delimiter
  DEL_COLON = 4

  # Use comma as delimiter
  DEL_COMMA = 5

  # Use line feed as delimiter
  DEL_LINEFEED = 6

  # Use return+line feed as delimiter
  DEL_CRLF = 7

  DELS = 8


  # enum: HWTYPE
  # Hardware Transport Layer

  HW_USB = 1

  HW_BT = 2

  HW_WIFI = 3

  HWTYPES = 4


  # enum: ENCRYPT
  # Encryption Types

  ENCRYPT_NONE = 0

  ENCRYPT_WPA2 = 1

  ENCRYPTS = 2


  # enum: LMS_ENCRYPT
  # Encryption Types

  LMS_ENCRYPT_NONE = 0

  LMS_ENCRYPT_WPA2 = 1

  LMS_ENCRYPTS = 2


  # enum: COLOR

  RED = 0

  GREEN = 1

  BLUE = 2

  BLANK = 3

  COLORS = 4


  # enum: NXTCOLOR
  # Constants related to color sensor value using Color sensor as color detector

  BLACKCOLOR = 1

  BLUECOLOR = 2

  GREENCOLOR = 3

  YELLOWCOLOR = 4

  REDCOLOR = 5

  WHITECOLOR = 6


  # enum: WARNING
  # Warnings

  WARNING_TEMP = 1

  WARNING_CURRENT = 2

  WARNING_VOLTAGE = 4

  WARNING_MEMORY = 8

  WARNING_DSPSTAT = 16

  WARNING_RAM = 32

  WARNING_BATTLOW = 64

  WARNING_BUSY = 128

  WARNINGS = 63


  # enum: OBJSTAT
  # Values used to describe an object's status

  # Object code is running
  RUNNING = 16

  # Object is waiting for final trigger
  WAITING = 32

  # Object is stopped or not triggered yet
  STOPPED = 64

  # Object is halted because a call is in progress
  HALTED = 128


  # enum: DEVCMD
  # Device commands used to control (UART sensors) devices

  # UART device reset
  DEVCMD_RESET = 17

  # UART device fire   (ultrasonic)
  DEVCMD_FIRE = 17

  # UART device channel (IR seeker)
  DEVCMD_CHANNEL = 18

  DEVCMDS = 19


end
