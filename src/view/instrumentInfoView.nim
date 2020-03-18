import karax / [vdom, karaxdsl, karax]
import dom
import strutils
import ../model/mapModel
from ../viewModel/mapViewModel import selected, updateInstrument, deleteSelected

proc updateInfoInstrument*(instrument: Instrument) =
    document.getElementById("x").value = $instrument.x
    document.getElementById("y").value = $instrument.y
    document.getElementById("heightInfo").value = $instrument.height
    document.getElementById("widthInfo").value = $instrument.width
    document.getElementById("angleInfo").value = $instrument.angle


proc renderInstrumentInfo*(): VNode =
    proc handler(ev: dom.Event, n: VNode) = 
        let x = parseInt($document.getElementById("x").value)
        let y = parseInt($document.getElementById("y").value)
        let height = parseInt($document.getElementById("heightInfo").value)
        let width = parseInt($document.getElementById("widthInfo").value)
        let angle = parseInt($document.getElementById("angleInfo").value)
        if selected != nil:
            selected.updateInstrument(x, y, height, width, angle)
    buildHtml(tdiv):
        tdiv():
            label(`for` = "x", class = "floatLabel"):
                text("x")
            input(`type` = "number", id = "x", value = "0", oninput = handler)
            label(`for` = "y", class = "floatLabel"):
                text("y")
            input(`type` = "number", id = "y", value = "0", oninput = handler)
        tdiv():
            label(`for` = "heightInfo", class = "floatLabel"):
                text("h")
            input(`type` = "number", id = "heightInfo", value = "0", oninput = handler)
            label(`for` = "widthInfo", class = "floatLabel"):
                text("w")
            input(`type` = "number", id = "widthInfo", value = "0", oninput = handler)
        tdiv():
            label(`for` = "angleInfo", class = "floatLabel"):
                text("a")
            input(`type` = "number", id = "angleInfo", value = "0", oninput = handler)
        tdiv(class = "btn", onclick = deleteSelected):
            text("Delete")