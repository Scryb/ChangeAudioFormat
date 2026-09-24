Simple command line tool to change the sample rate of any connected audio device on macOS.

## Usage:

`ChangeAudioFormat -d (or --device) "Name of target device" -s (or --samplerate) [samplerate in hz]`

_Example:_

`ChangeAudioFormat -d "External Headphones" -s 48000`

Can be installed by building and copying the executable from Xcode's build folder to /usr/local/bin.

Uses [SimplyCoreAudio](https://github.com/rnine/SimplyCoreAudio) to greatly simplify interactions with CoreAudio.

**License**

ChangeAudioFormat was written by Anders Lundberg (@scryb) in 2026 and is licensed under the MIT license. See [Licence.md](https://github.com/Scryb/ChangeAudioFormat/blob/main/ChangeAudioFormat/License.md).
