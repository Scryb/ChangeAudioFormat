## ChangeAudioFormat

Simple command line tool to change the sample rate of any connected audio device on macOS. Uses [SimplyCoreAudio](https://github.com/rnine/SimplyCoreAudio) to greatly simplify interactions with CoreAudio.

### Usage

`ChangeAudioFormat -d (or --device) "Name of target device" -s (or --samplerate) [samplerate in hz]`

_Example:_

`ChangeAudioFormat -d "External Headphones" -s 48000`

Will exit with an error message if device doesn't exist, doesn't support the sample rate or if an argument is missing.

### Installation

Use Xcode to build and copy the executable from Xcode's build folder to /usr/local/bin.

### License

ChangeAudioFormat was written by Anders Lundberg (@scryb) in 2026 and is licensed under the MIT license. See [Licence.md](https://github.com/Scryb/ChangeAudioFormat/blob/main/License.md).
