import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
     @IBAction functions are called only when the
     linked action (in this case, pressing the button)
     occurs.
     
     The identity of the button that got tapped gets
     sent over to the parameter sender.
     */
    @IBAction func keyPressed(_ sender: UIButton) {
        let currNote = sender.titleLabel!.text!.uppercased()
//        print("Note: \(currNote)")
        
        playSound(note: currNote)

    }
    
    func playSound(note: String) {
        // Get the file path to the sound file
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}


