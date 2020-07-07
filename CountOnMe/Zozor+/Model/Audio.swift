
import Foundation
import AVFoundation

class Audio {
    
    var player: AVAudioPlayer?
    var path = Bundle.main.path(forResource: "sound1", ofType: "wav")!
    
    func audio(sound : Character){
        
        switch sound {
        case "1":  path = Bundle.main.path(forResource: "sound1", ofType: "wav")!
        case "2":  path = Bundle.main.path(forResource: "sound2", ofType: "wav")!
        case "3":  path = Bundle.main.path(forResource: "sound3", ofType: "wav")!
            
        default:
            print("default: sound has no type")
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("couldn't load sound")
        }
        
    }
    
}

