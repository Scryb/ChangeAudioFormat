/*
 * Copyright © 2026 Anders Lundberg
 *
 * Licensed under the MIT License, see License.md
 *
 */

import Foundation
import SimplyCoreAudio

func changeAudioFormat(device: String, samplerate: Float64) {
    let coreAudio = SimplyCoreAudio()
    if let targetDevice = coreAudio.allOutputDevices.first(where: { $0.name.contains(device) }) {
        if let supportedRates = targetDevice.nominalSampleRates, supportedRates.contains(samplerate) {
            targetDevice.setNominalSampleRate(samplerate)
            print("Set sample rate of \(device) to \(samplerate / 1000) kHz")
        } else {
            print("Device does not support \(samplerate) Hz. Available rates: \(String(describing: targetDevice.nominalSampleRates))")
            exit(1)
        }
    }
    else {
        print("Error: no \(device) device found")
        exit(1)
    }
}

var outputDevice: String?
var sampleRate: Float64?

var arguments = CommandLine.arguments.dropFirst()

while let argument = arguments.popFirst() {
    switch argument {
    case "-d", "--device":
        guard let value = arguments.popFirst() else {
            print("Error: \(argument) requires a value")
            exit(1)
        }
        outputDevice = value

    case "-s", "--samplerate":
        guard let value = arguments.popFirst(),
              let rate = Float64(value) else {
            print("Error: \(argument) requires a numeric value (e.g. 44100")
            exit(1)
        }
        sampleRate = rate

    default:
        print("Error: Unknown argument '\(argument)'")
        exit(1)
    }
}

// Check that all required arguments were provided
guard let outputDevice,
      let sampleRate else {
    print("""
    Usage:
      ChangeAudioFormat -d <device> -s <samplerate> -b <bitrate>

    Options:
      -d, --device       Device name
      -s, --samplerate   Sample rate
    """)
    exit(1)
}

changeAudioFormat(device: outputDevice, samplerate: sampleRate)
