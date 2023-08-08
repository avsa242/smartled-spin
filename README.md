# smartled-spin
---------------

This is a P8X32A/Propeller driver object for various model smart/addressable LED arrays (e.g., NeoPixels)

**IMPORTANT**: This software is meant to be used with the [spin-standard-library](https://github.com/avsa242/spin-standard-library) (P8X32A) or [p2-spin-standard-library](https://github.com/avsa242/p2-spin-standard-library) (P2X8C4M64P). Please install the applicable library first before attempting to use this code, otherwise you will be missing several files required to build the project.

## Salient Features

* Supports WS2811, WS2812, WS2812B, WS2813, SK6812 (RGB and RGBW), and TM1803-based LED arrays
* Integration with generic bitmap graphics library

## Requirements

P1/SPIN1:
* 80MHz Fsys
* spin-standard-library
* 1 extra core/cog for the PASM SmartLED engine
* graphics.common.spinh (provided by spin-standard-library)

P2/SPIN2:
* 20MHz Fsys minimum
* p2-spin-standard-library
* graphics.common.spin2h (provided by p2-spin-standard-library)

## Compiler Compatibility

| Processor | Language | Compiler               | Backend      | Status                |
|-----------|----------|------------------------|--------------|-----------------------|
| P1        | SPIN1    | FlexSpin (6.2.1)       | Bytecode     | OK                    |
| P1        | SPIN1    | FlexSpin (6.2.1)       | Native/PASM  | OK                    |
| P2        | SPIN2    | FlexSpin (6.2.1)       | NuCode       | OK                    |
| P2        | SPIN2    | FlexSpin (6.2.1)       | Native/PASM2 | OK                    |

(other versions or toolchains not listed are __not supported__, and _may or may not_ work)


## Hardware compatibility

* Tested with WS2812 (GRB), SK6812 (GRBW)

## Limitations

* TBD

