import Foundation
@testable import Element
@testable import Utils
class ValueBar:Element{
    override func resolveSkin() {
        super.resolveSkin()
        
        
        /*strings.forEach{
            let textArea:TextArea = TextArea(NaN,NaN,$0,leftBar!)
            leftBarItems.append(textArea)
            _ = leftBar!.addSubView(textArea)
            textArea.setPosition(CGPoint(0,y))
            y += itemYSpace!
        }*/

    }
}
extension ValueBar{
    /**
     *
     */
    func addStyles(){
        var css:String = ""
        css +=	"ValueBar{"
        css +=		"float:none;"
        css +=		"clear:none;"
        css +=		"fill:yellow;"
        css +=		"fill-alpha:0.2;"
        css +=		"width:32px;"
        css +=	"}"
        css +=	"ValueBar TextArea{"
        css +=		"float:none;"
        css +=		"clear:none;"
        css +=		"fill:green;"
        css +=		"fill-alpha:0;"
        css +=		"line:grey;"
        css +=		"line-alpha:0;"
        css +=		"line-thickness:0px;"
        css +=		"padding-right:0px;"
        css +=		"padding-top:0px;"
        css +=		"margin-top:-10px;"
        css +=		"margin-bottom:10px;"
        css +=		"margin-left:8px;"
        css +=		"height:20px;"
        css +=		"width:100%;"
        css +=	"}"
        css +=	"ValueBar TextArea Text{"
        css +=		"border:false;"
        css +=		"color:#C5C9CC;"
        css +=		"backgroundColor:orange;"
        css +=		"background:false;"
        css +=		"width:100%;"
        css +=		"size:10px;"
        css +=		"margin-top:0px;"
        css +=		"height:20px;"
        css +=		"margin-left:0px;"
        css +=	"}"
        StyleManager.addStyle(css)
    }
}
