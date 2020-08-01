

function createComponent(componentName,parent,sub={}) {
    var component = Qt.createComponent(componentName);
    var sprite = component.createObject(parent,sub);
    return sprite;
}
function createQmlObject(name, parent) {
    return Qt.createQmlObject('import QtQuick 2.0; '+name+' {}',
                                        parent,
                                        "new");
}
function createQmlObjectSrc(src, parent) {
    return Qt.createQmlObject(src,
                                        parent,
                                        "new");
}

function forEachListModel(lmodel, callback) {
    for (var i = 0; i < lmodel.count; i++) {
        callback(lmodel.get(i))
    }
}
function forEach(lmodel, callback) {
    for (var i = 0; i < lmodel.length; i++) {
        callback(lmodel[i])
    }
}
function http(type, url, callback, token=undefined) {
    var xhr = new XMLHttpRequest()
    if(type==="get" | type==="GET"){
        xhr.open("GET", url, true)
    }else if(type==="post" | type==="POST"){
        xhr.open("POST", url, true)
    }
    else if(type==="put" | type==="PUT"){
        xhr.open("PUT", url, true)
    }

    if (token !== undefined){
        xhr.setRequestHeader('Authorization', 'Token ' + toek)
    }
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            callback(xhr)
        }
    }
    xhr.send(null)
}
function assert (condition, message) {
    try{
        if (!condition)
            return false
        return true
    } catch(e){
        return false
    }
}
function int(value) {
    value = value.toString().replace(" ","")
    return parseInt(value)
}
function mFormat(value){
    return Number(value).toLocaleString(Qt.locale('fr_FR')).replace(",00","")
}
function dtFormat(value,format){
    return new Date(value).toLocaleString(Qt.locale('fr_FR'),format)
}
