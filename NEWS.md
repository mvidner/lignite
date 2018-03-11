# News

## unreleased

- Fixed silent corruption of files obtained by `ev3tool download`

## 0.5.0, 2018-03-05

- Ev3Ops: added missing array_* ops (with PARV in the signature).
- loop_while added, with a Condition prototype: Lt32.
- Corrected the variable argument calling convention (PARNO).
  Before, it was necessary to manually add a parameter specifying the number
  of the remaining parameters. Now it is automatic.

## 0.4.0, 2018-03-04

- Generate Ev3Ops ahead of time, enabling YARD docs for them,
  reducing startup time
- Fixed `ev3tool ls`, `ls-l`, `start`, all broken in 0.3.0

## 0.3.0, 2018-03-02

- Added Tap and Replay to simulate a real robot with YAML files for tests
- `ev3tool help` added
- `ev3tool run` changed to `ev3tool start` (because Thor reserves `run`)

## 0.2.0, 2018-02-26

- DirectCommand can handle replies, allowing to read sensor data
- Motors, for easy DirectCommands to motors
    - with an example program for a [Tea Serving Robot][tea], which is a standard [Bobb3e][]
- Assembler can compile global variables
- More control flow: `if`, `loop_while_postcond`

[Bobb3e]: https://www.lego.com/mindstorms/build-a-robot/bobb3e
[tea]: https://www.youtube.com/watch?v=0KOEvz09kkA
