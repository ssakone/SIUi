import QtQuick 2.12

Item {
    property int lg: 1
    property var md: 2
    property var xl: 1
    property var sm: 3
    property var xs: 6
    property var xxs: 12
    function getLg(){
        return ((parent.width*lg)/12)-parent.spacing
    }
    function getMd(){
        return ((parent.width*md)/12)-parent.spacing
    }
    function getXl(){
        return ((parent.width*xl)/12)-parent.spacing
    }
    function getSm(){
        return ((parent.width*sm)/12)-parent.spacing
    }
    function getXs(){
        return ((parent.width*xs)/12)-parent.spacing
    }
    function getXXs(){
        return ((parent.width*12)/12)-parent.spacing
    }

    width: {
        if(lg!==undefined & md!==undefined &sm!==undefined   & xl!==undefined & xs!==undefined & xxs!==undefined){
            if(parent.width>=1200){
                getXl()
            }
            else if(parent.width>=992){
                getLg()
            }
            else if(parent.width>=768){
                getMd()
            }
            else if(parent.width>=576){
                getSm()
            }
            else if(parent.width>=359){
                getXs()
            }else if(parent.width<=359){
                getXXs()
            }
        }
        else if(lg!==undefined & md!==undefined &sm!==undefined   & xl!==undefined & xs!==undefined){
            if(parent.width>=1200){
                getXl()
            }
            else if(parent.width>=992){
                getLg()
            }
            else if(parent.width>=768){
                getMd()
            }
            else if(parent.width>=576){
                getSm()
            }
            else if(parent.width<576){
                getXs()
            }else if(parent.width<359){
                getXXs()
            }
        }else if(lg!==undefined & md!==undefined  & xl!==undefined){
            if(parent.width>=1200){
                getXl()
            }
            else if(parent.width>=992){
                getLg()
            }
            else if(parent.width>=768){
                getMd()
            }
            else if(parent.width>=576){
                getSm()
            }

        }else if(lg!==undefined & md!==undefined &sm!==undefined){
            if(parent.width>=992){
                getLg()
            }
            else if(parent.width>=768){
                getMd()
            }
            else if(parent.width>=576){
                getSm()
            }
        }else if(lg!==undefined & md!==undefined){
            if(parent.width>=992){
                getLg()
            }
            else if(parent.width>=768){
                getMd()
            }
        }else if(lg!==undefined){
            getLg()
        }
    }
}
