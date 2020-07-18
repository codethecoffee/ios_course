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
        let currNote = sender.currentTitle!.uppercased()
        playSound(note: currNote)
        
        // Halve opacity of button to provide feedback that
        // button was clicked
        sender.alpha /= 2
        
        // Return to original opacity 0.2 seconds after click
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {sender.alpha = 1})

    }
    
    func playSound(note: String) {
        // Get the file path to the sound file
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}


