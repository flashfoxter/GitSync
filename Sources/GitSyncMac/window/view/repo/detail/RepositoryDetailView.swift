import Foundation
@testable import Utils
@testable import Element

class DebugText:Element {
    lazy var textField:Element = {return self.addSubView(Element(NaN,NaN,self,"textField"))}()
    override func resolveSkin() {
        super.resolveSkin()
        _ = textField
    }
}
class DebugTextArea:DebugText {
    override func resolveSkin() {
        super.resolveSkin()
    }
    override func setSize(_ width: CGFloat, _ height: CGFloat) {
        super.setSize(width, height)
        textField.setSize(width, height)
    }
}
class DebugTextInput:Element {
    lazy var text:Element = {return self.addSubView(DebugText(NaN,NaN,self))}()
    lazy var textArea:Element = {return self.addSubView(DebugTextArea(NaN,NaN,self))}()
    override func resolveSkin() {
        var css:String = ""
        css += "DebugTextInput DebugTextInput{fill:orange;width:100%;height:48px;float:left;clear:left;padding-right:100px;fill:yellow;}"
        css += "DebugTextInput DebugTextInput DebugText{fill:purple;width:100px;height:48px;float:left;clear:none;}"
        css += "DebugTextInput DebugTextInput DebugText #textField{fill:grey;width:76;height:24px;float:left;clear:none;margin-left:12px;margin-top:12px;}"
        css += "DebugTextInput DebugTextInput DebugTextArea{fill:green;width:100%;height:48px;float:left;clear:none;padding:12px;}"
        css += "DebugTextInput DebugTextInput DebugTextArea #textField{fill:grey;width:100%;height:24px;float:left;clear:none;}"
        StyleManager.addStyle(css)
        super.resolveSkin()
        _ = text
        _ = textArea
    }
    override func setSize(_ width: CGFloat, _ height: CGFloat) {
        super.setSize(width, height)
        textArea.setSize(width, height)
    }
}
class RepositoryDetailView:Element {
    lazy var contentContainer:Container = {return self.addSubView(Container(self.width,self.height,self,"lable"))}()
    lazy var textInput:DebugTextInput = {return self.contentContainer.addSubView(DebugTextInput(NaN,NaN,self.contentContainer))}()
    
    //lazy var nameTextInput:TextInput = {return self.contentContainer.addSubView(TextInput(self.width, 32, "Name: ", "", self.contentContainer))}()
    //lazy var localPathTextInput:TextInput = {return self.contentContainer.addSubView(TextInput(self.width, 32, "Local-path: ", "", self.contentContainer))}()
    override func resolveSkin() {
        var css:String = ""
        css += "RepositoryView RepositoryDetailView{fill:red;width:100%;float:left;clear:none;}"
        css += "RepositoryDetailView{float:left;clear:left;100%;}"
        css += "RepositoryDetailView Container#lable{float:left;clear:left;width:100%;padding-right:0px;}"
        StyleManager.addStyle(css)
        super.resolveSkin()
        _ = contentContainer
        _ = textInput
       
        //_ = nameTextInput
        //_ = localPathTextInput
    }
    override func setSize(_ width: CGFloat, _ height: CGFloat) {
        super.setSize(width, height)
        contentContainer.setSize(width, height)
        textInput.setSize(width, height)
    }
}
