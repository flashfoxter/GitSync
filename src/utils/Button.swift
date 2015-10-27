import Cocoa
//can you overide functionality with extension? if so you may be able to do the updateLayer another place for all similar graphic elements
//research the above
class Button: NSButton,IElement {
    var style:IStyle
    init(_ width: Int = 100, _ height: Int = 40, _ style:IStyle = Style.clear) {
        self.style = style
        let frame = NSRect(x: 0, y: 0, width: width, height: height)
        super.init(frame: frame)
        self.wantsLayer = true//need for the updateLayer method to be called internally
    }
    override func updateLayer() {//called on init if wantsUpdateLayer is true
        Swift.print("redraw: ")
        if(self.cell!.highlighted){
            Swift.print("pressed state")
        }else{
            Swift.print("unPressed state")
        }
        /*These states can be used for toggle buttons*/
        switch self.state {
            case NSOnState :// Draw on state
                Swift.print("on")
            case NSMixedState :// Draw mixed state
                Swift.print("mixed")
            case NSOffState :
                Swift.print("off")
            default:
                break;
        
        }
        resolveSkin()//extension method that draws the graphics
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var wantsUpdateLayer:Bool{//enables the call of updateLayer
        return true
    }
    override func mouseEntered( event: NSEvent){
        Swift.print("entered")
    }
    override func mouseExited(event: NSEvent){
         Swift.print("exited")
    }
}