import AVFoundation

/// Manages real-time two-tone synthesis using AVAudioEngine.
final class AudioEngine: ObservableObject {

    private let engine = AVAudioEngine()
    private let rootNode = AVAudioPlayerNode()
    private let upperNode = AVAudioPlayerNode()
    private let mixerNode: AVAudioMixerNode

    private let sampleRate: Double = 44100
    private let bufferSize: AVAudioFrameCount = 4096

    init() {
        mixerNode = engine.mainMixerNode
        engine.attach(rootNode)
        engine.attach(upperNode)

        let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)!
        engine.connect(rootNode,  to: mixerNode, format: format)
        engine.connect(upperNode, to: mixerNode, format: format)

        try? engine.start()
    }

    /// Play a continuous sine tone at the given frequency on the specified node.
    func play(frequency: Double, on node: AVAudioPlayerNode) {
        node.stop()
        let format = AVAudioFormat(standardFormatWithSampleRate: sampleRate, channels: 1)!
        let buffer = makeSineBuffer(frequency: frequency, format: format)
        node.scheduleBuffer(buffer, at: nil, options: .loops)
        node.play()
    }

    func playRoot(frequency: Double)  { play(frequency: frequency, on: rootNode) }
    func playUpper(frequency: Double) { play(frequency: frequency, on: upperNode) }

    func stopAll() {
        rootNode.stop()
        upperNode.stop()
    }

    // MARK: - Private

    private func makeSineBuffer(frequency: Double, format: AVAudioFormat) -> AVAudioPCMBuffer {
        let buffer = AVAudioPCMBuffer(pcmFormat: format, frameCapacity: bufferSize)!
        buffer.frameLength = bufferSize
        let data = buffer.floatChannelData![0]
        for i in 0..<Int(bufferSize) {
            data[i] = Float(sin(2.0 * .pi * frequency * Double(i) / sampleRate))
        }
        return buffer
    }
}
