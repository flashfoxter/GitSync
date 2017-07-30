import Cocoa
@testable import Utils
@testable import Element

extension ProtoTypeView {
    /**
     * Frame animation for promptButton
     */
    func promptButtonAnim(point:CGPoint){
        self.promptBtn.layer?.position = point
    }
    /**
     * Frame animation for modal (buttonRect to modalRect)
     */
    func modalFrameAnim(roundedRect:RoundedRect){
        //Swift.print("roundedRect: " + "\(roundedRect)")
        Swift.print("roundedRect.w: " + "\(roundedRect.w)")
        self.modalBtn.setAppearance(roundedRect)
//        disableAnim {
        
//        }
    }
}