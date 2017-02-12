import Cocoa
@testable import Utils
@testable import Element
@testable import GitSyncMac

class ListTransitionTestWin:Window {
    required init(_ docWidth:CGFloat,_ docHeight:CGFloat){
        super.init(docWidth, docHeight)
        WinModifier.align(self, Alignment.centerCenter, Alignment.centerCenter,CGPoint(6,0))/*aligns the window to the screen*/
    }
    override func resolveSkin() {
        Swift.print("frame.width: " + "\(frame.size.width)")
        Swift.print("frame.height: " + "\(frame.size.height)")
        self.contentView = ListTransitionTestView(frame.size.width,frame.size.height)
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

class ListTransitionTestView:TitleView{
       override init(_ width:CGFloat, _ height:CGFloat, _ parent:IElement? = nil, _ id:String? = "") {
        //self.title = "Resolve merge conflict:"//Title: Resolve sync conflict:
        super.init(width, height, parent, "listTransitionTestView")
    }
    override func resolveSkin() {
        Swift.print("ListTransitionTestView.resolveSkin()")
        super.resolveSkin()
        Swift.print(ElementParser.stackString(self))
        createGUI()
    }
    func createGUI(){
        //animTest()
        //uiSwitchTest()
        //barGraphTest()
        rbSliderFastList3()
        //sliderFastList3()
        //fastList3()
        //dpTests()
        //rbSliderFastList2()
        //sliderFastList2()
        //fastList2()
        //sliderFastList()
        //fastList()
        //sliderList()
        //list()
    }
    
    var animator:Animator?
    var ellipse:EllipseGraphic?
    /**
     * Tests the animation suite
     */
    func animTest(){
        StyleManager.addStyle("Button#test{fill:green;float:left;clear:left;}")
        let btn = addSubView(Button(96,24,self,"test"))
        /*Ellipse*/
        ellipse = EllipseGraphic(0,100,50,50,FillStyle(NSColor.blue),nil)
        _ = addSubView(ellipse!.graphic)
        ellipse!.draw()
        
        func onButtonDown(event:Event){
            if(event.type == ButtonEvent.upInside){
                Swift.print("click")
                animator = Animator(Animation.sharedInstance,0.5,0,300,progress,Back.easeOut)
                animator!.start()
            }
        }
        btn.event = onButtonDown
    }
    func progress(value:CGFloat){
        Swift.print("value: " + "\(value)")
        ellipse!.graphic.X = value
    }
    /**
     *
     */
    func uiSwitchTest(){
        Swift.print("uiSwitchTest")
        let container:Container = addSubView(Container(NaN, NaN, self, "switchContainer"))
        let toggleSwitch = container.addSubView(Switch(140,80,false,container))
        func onEvent(event:Event){/*this is the event handler*/
            if(event.assert(CheckEvent.check, toggleSwitch)){
                Swift.print("onEvent() isChecked" + "\((event as! CheckEvent).isChecked)")
            }
        }
        toggleSwitch.event = onEvent/*adds the event handler to the event exit point in the toggleSwitch*/
    }
    /**
     *
     */
    func barGraphTest(){
        let graphContainer = addSubView(Container(width,height,self,"graph"))
        let graph = graphContainer.addSubView(BarGraph(200,200/*,4*/,graphContainer))
        _ = graph
    }
    var list:SliderFastList3?
    var btnTop:TextButton?
    var btnBottom:TextButton?
    var btnCenter:TextButton?
    var startIdxText:TextInput?
    var endIdxText:TextInput?
    func rbSliderFastList3(){
        let dp:DataProvider = DataProvider("~/Desktop/ElCapitan/assets/xml/scrollist.xml".tildePath)//longlist.xml,list.xml//DataProvider()//
        /*dp.addItem(["title":"pink"])
        dp.addItem(["title":"orange"])
        dp.addItem(["title":"purple"])*/
        
        list = addSubView(SliderFastList3(140, 145, 24, dp, self))/*RBSliderFastList3*/
        
        var css = "Container#btn{float:left;clear:none;}"
        css += "Container#btn TextButton{margin:6px;}"
        css += "Container#btn TextArea{margin:6px;}"
        
        StyleManager.addStyle(css)
        let container = addSubView(Container(100,100,self,"btn"))
        
        btnTop = container.addSubView(TextButton(80,20,"top",container))
        btnBottom = container.addSubView(TextButton(80,20,"bottom",container))
        btnCenter = container.addSubView(TextButton(80,20,"center",container))
        
        /*Text*/
        startIdxText = container.addSubView(TextInput(120,20,"Start idx:","",container))
        endIdxText = container.addSubView(TextInput(120,20,"End idx: ","",container))
        
        //continue here: override onScrollwheel instead to debug with
        
        
        func onButtonEvent(_ event:Event){
            if(event.type == ButtonEvent.upInside){
                if(event.origin === btnTop){
                    list!.dataProvider.addItemAt(["title":"tangerine","property":""], 0)
                }else if(event.origin === btnBottom){
                    list!.dataProvider.addItem(["title":"magenta","property":""])
                }else if(event.origin === btnCenter){
                    list!.dataProvider.addItemAt(["title":"cyan","property":""], (list!.dataProvider.count/2))
                }
            }
        }
        btnTop!.event = onButtonEvent
        btnBottom!.event = onButtonEvent
        btnCenter!.event = onButtonEvent
    }
    
    //Continue here: use InputText component with description.
        //then add textfields about add item, at what idx, which idxes got reused, which got moved etc
            //create special events that propegate and inform the debug gui
    
    override func scrollWheel(with event:NSEvent) {
        startIdxText!.setTextValue(list!.pool.first!.idx.string)
        endIdxText!.setTextValue(list!.pool.last!.idx.string)
        
        super.scrollWheel(with:event)/*forwards the event other delegates higher up in the stack*/
    }
    /**
     *
     */
    func sliderFastList3(){
        //add small list
        //big list
        let dp:DataProvider = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)//DataProvider()//
        /*dp.addItem(["title":"pink"])
        dp.addItem(["title":"orange"])
        dp.addItem(["title":"purple"])*/
        let list = addSubView(SliderFastList3(140, 145, 24, dp, self))
        _ = list
    }
    /**
     *
     */
    func fastList3(){
        //add small list
        //big list
        //then start adding removing items
        
        let dp:DataProvider = DataProvider()//DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        //dp.addItem(["title":"pink"])
        //dp.addItem(["title":"orange"])
        //dp.addItem(["title":"purple"])
        let list = addSubView(FastList3(140,73,24,dp,self))
        _ = list
    }
    /**
     * Try to add and remove items. count the items after
     */
    func dpTests(){
        let dp:DataProvider = DataProvider()//DataProvider("~/Desktop/ElCapitan/assets/xml/list.xml".tildePath)//longlist.xml
        
        func onDpChange(event:Event){
            if(event.type == DataProviderEvent.add){
                Swift.print("dp.count: " + "\(dp.count)")
            }
            if(event.type == DataProviderEvent.remove){
                Swift.print("dp.count: " + "\(dp.count)")
            }
        }
        dp.event = onDpChange
        dp.addItem(["title":"pink"])
        dp.addItem(["title":"orange"])
        dp.addItem(["title":"purple"])
        _ = dp.removeItemAt(0)
        _ = dp.removeItemAt(0)
        _ = dp.removeItemAt(0)
    }
    func rbSliderFastList2(){
        let dp:DataProvider = DataProvider()//DataProvider("~/Desktop/ElCapitan/assets/xml/list.xml".tildePath)//longlist.xml
        dp.addItem(["title":"pink"])
        dp.addItem(["title":"orange"])
        dp.addItem(["title":"purple"])
        
        let list = self.addSubView(RBSliderFastList2(140, 145, 24, dp, self))
        _ = list
    }
    func sliderFastList2(){
        let dp:DataProvider = DataProvider()//DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        dp.addItem(["title":"pink"])
        dp.addItem(["title":"orange"])
        dp.addItem(["title":"purple"])
        let list = self.addSubView(SliderFastList2(140, 73, 24, dp, self))
        _ = list
        /*add*/
        let addBtn = addSubView(TextButton(100,24,"add",self))
        func onAdd(event:Event){
            if(event.type == ButtonEvent.upInside){
                Swift.print("added item to list")
                list.dataProvider.addItemAt(["title":"fuchsia"], 0)//add item at index 2
            }
        }
        addBtn.event = onAdd
        /*remove*/
        let removeBtn = addSubView(TextButton(100,24,"remove",self))
        func onRemove(event:Event){
            if(event.type == ButtonEvent.upInside){
                Swift.print("remove item at index: 0")
                _ = list.dataProvider.removeItemAt(0)
            }
        }
        removeBtn.event = onRemove
    }
    func fastList2(){
        let dp:DataProvider = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        let list = addSubView(FastList2(140,73,24,dp,self))
        _ = list
    }
    func sliderFastList(){
        var dp:DataProvider
        dp = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        //dp = DataProvider()
        //dp.addItem(["title":"pink"])
        
        let list = self.addSubView(SliderFastList(140, 73, 24, dp, self))
        //ListModifier.select(list, "white")
        FastListModifier.select(list, 5)
    }
    func fastList(){
        let dp:DataProvider = DataProvider("~/Desktop/assets/xml/scrollist.xml".tildePath)
        let list = addSubView(FastList(140,73,24,dp,self))
        _ = list
    }
    func sliderList(){
        let dp:DataProvider = DataProvider()
        dp.addItem(["title":"pink"])
        dp.addItem(["title":"orange"])
        dp.addItem(["title":"purple"])

        let list = addSubView(SliderList(140,145,24,dp,self))
        _ = list
    }
    func createList(){
        let dp = DataProvider(FileParser.xml("~/Desktop/ElCapitan/assets/xml/list.xml".tildePath))/*Loads xml from a xml file on the desktop*/
        let list = self.addSubView(List(140, 144, NaN, dp,self))
        _ = list
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
