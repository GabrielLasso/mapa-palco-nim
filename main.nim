import karax / [vdom, karaxdsl, karax]
import src/view/sideMenuView
import src/view/mapInfoView
import src/view/instrumentInfoView
import src/view/mapView
import src/helper/storage
import dom

proc createDom(): VNode =
    result = buildHtml(tdiv):
        renderSideMenu()
        img(src = "placeholder.png", id = "placeholder")
        tdiv(id = "mainView", class="showLater"):
            tdiv(id = "header"):
                tdiv(id = "sequence")
                tdiv(id = "city")
                tdiv(id = "team")
                tdiv(id = "music")
            tdiv(class = "flex"):
                tdiv(id = "map")
                table(id = "instrumentList")
        tdiv(id = "rightSideMenu", class="showLater"):
            renderMapInfo()
            renderInstrumentInfo()

setRenderer createDom, "ROOT", proc () = 
    if (storage.getItem("quickSave") != nil):
        loadMapFromJson($storage.getItem("quickSave"))
