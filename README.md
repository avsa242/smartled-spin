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

| Processor | Language | Compiler               | Backend     | Status                |
|-----------|----------|------------------------|-------------|-----------------------|
| P1        | SPIN1    | FlexSpin (5.9.14-beta) | Bytecode    | OK                    |
| P1        | SPIN1    | FlexSpin (5.9.14-beta) | Native code | OK                    |
| P1        | SPIN1    | OpenSpin (1.00.81)     | Bytecode    | Untested (deprecated) |
| P2        | SPIN2    | FlexSpin (5.9.14-beta) | NuCode      | Untested              |
| P2        | SPIN2    | FlexSpin (5.9.14-beta) | Native code | OK                    |
| P1        | SPIN1    | Brad's Spin Tool (any) | Bytecode    | Unsupported           |
| P1, P2    | SPIN1, 2 | Propeller Tool (any)   | Bytecode    | Unsupported           |
| P1, P2    | SPIN1, 2 | PNut (any)             | Bytecode    | Unsupported           |

## Hardware compatibility

* Tested with WS2812 (GRB), SK6812 (GRBW)

## Limitations

* TBD

