import Foundation
@testable import Element
@testable import Utils

class RepositoryView:Element{
    lazy var contentContainer:Container = {return self.addSubView(Container(self.width,self.height,self,"content"))}()
    lazy var leftSideBar:LeftSideBar = {
        return self.contentContainer.addSubView(LeftSideBar(NaN,self.height,self.contentContainer))
    }()
    lazy var detailView:RepositoryDetailView = {
        return self.contentContainer.addSubView(RepositoryDetailView(NaN,self.height,self.contentContainer))//self.addSubView(Section(NaN,self.height,self,"right"))
    }()
    override func resolveSkin() {
        var css:String = "RepositoryView{float:left;clear:left;}"
        css += "RepositoryView Container#content{float:left;clear:left;width:100%;padding-right:200px;}"
        css += "RepositoryView #left{fill:blue;width:200px;float:left;clear:none;}"

        StyleManager.addStyle(css)
        super.resolveSkin()
        _ = contentContainer
        _ = leftColumn
        _ = detailView
    }
    override func setSize(_ width: CGFloat, _ height: CGFloat) {
        super.setSize(width, height)
        Swift.print("RepositoryView.setSize(\(width), \(height))")
        //update the skin of columns 🏀
        leftColumn.setSize(leftColumn.getWidth(), height)
        detailView.setSize(leftColumn.getWidth(), height)
    }
}
class LeftSideBar:Element{
    lazy var list:Element = {
        return self.addSubView(Element(NaN,self.height,self,"list"))
    }()
    override func resolveSkin() {
        super.resolveSkin()
        _ = list
    }
}
