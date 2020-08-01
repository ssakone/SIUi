pragma Singleton
import QtQuick 2.11
import QtQuick.Controls 2.4
import si.Dialog 1.0


Item {
    id: sifontype
    property int density: 1
    property int dpiDensity: 1
    property string roboto_black: robotoBlack.name
    property string roboto_black_italic: robotoBlackItalic.name
    property string roboto_bold: robotoBold.name
    property string roboto_bold_condensed: robotoBoldCondensed.name
    property string roboto_bold_condensed_italic: robotoBoldCondensedItalic.name
    property string roboto_italic: robotoItalic.name
    property string roboto_condensed: robotoCondensed.name
    property string roboto_ligth: robotoLight.name
    property string roboto_light_italic: robotoLightItalic.name
    property string roboto_medium: robotoMedium.name
    property string roboto_medium_italic: robotoMediumItalic.name
    property string roboto_regular: robotoRegular.name
    property string roboto_thin: robotoThin.name
    property string roboto_thin_italic: robotoThinItalic.name
    property string fontAwesome: font4.name
    property string materialIcon: font3.name

    FontLoader {
        id: font3
        source: "qrc:/qrc/Material.ttf"
    }

    FontLoader {
        id: font4
        property string family: "FontAwesome"
        source: "qrc:/qrc/fontawesome-webfont.ttf"
    }
    FontLoader {
        id: robotoBlack
        source: "qrc:/qrc/roboto/Roboto-Black.ttf"
    }
    FontLoader {
        id: robotoBlackItalic
        source: "qrc:/qrc/roboto/Roboto-BlackItalic.ttf"
    }
    FontLoader {
        id: robotoBold
        source: "qrc:/qrc/roboto/Roboto-Bold.ttf"
    }
    FontLoader {
        id: robotoBoldCondensed
        source: "qrc:/qrc/roboto/Roboto-BoldCondensed.ttf"
    }
    FontLoader {
        id: robotoBoldCondensedItalic
        source: "qrc:/qrc/roboto/Roboto-BoldCondensedItalic.ttf"
    }
    FontLoader {
        id: robotoItalic
        source: "qrc:/qrc/roboto/Roboto-Italic.ttf"
    }
    FontLoader {
        id: robotoCondensed
        source: "qrc:/qrc/roboto/Roboto-Light.ttf"
    }
    FontLoader {
        id: robotoLight
        source: "qrc:/qrc/roboto/Roboto-Light.ttf"
    }
    FontLoader {
        id: robotoLightItalic
        source: "qrc:/qrc/roboto/Roboto-LightItalic.ttf"
    }
    FontLoader {
        id: robotoMedium
        source: "qrc:/qrc/roboto/Roboto-Medium.ttf"
    }
    FontLoader {
        id: robotoMediumItalic
        source: "qrc:/qrc/roboto/Roboto-MediumItalic.ttf"
    }
    FontLoader {
        id: robotoRegular
        source: "qrc:/qrc/roboto/Roboto-Regular.ttf"
    }
    FontLoader {
        id: robotoThin
        source: "qrc:/qrc/roboto/Roboto-Thin.ttf"
    }
    FontLoader {
        id: robotoThinItalic
        source: "qrc:/qrc/roboto/Roboto-ThinItalic.ttf"
    }

    property font iHEAD1: Qt.font({
        pixelSize: 96*density,
        letterSpacing: -1.5,
        family: sifontype.roboto_ligth,
        weight: Font.Light
    })
    property font iHEAD2: Qt.font({
        pixelSize: 60*density,
        letterSpacing: -0.5,
        family: sifontype.roboto_ligth,
        weight: Font.Light
    })
    property font iHEAD3: Qt.font({
        pixelSize: 48*density,
        letterSpacing: 0,
        family: sifontype.roboto_regular,
        weight: Font.Normal
    })
    property font iHEAD4: Qt.font({
        pixelSize: 34*density,
        letterSpacing: 0.25,
        family: sifontype.roboto_regular,
        weight: Font.Normal
    })
    property font iHEAD5: Qt.font({
        pixelSize: 24*density,
        letterSpacing: 0,
        family: sifontype.roboto_regular,
        weight: Font.Normal
    })
    property font iHEAD6: Qt.font({
        pixelSize: 20*density,
        letterSpacing: 0.15,
        family: sifontype.roboto_medium,
        weight: Font.Medium
    })
    property font iSubTitle1: Qt.font({
        pixelSize: 16*density,
        letterSpacing: 0.15,
        family: sifontype.roboto_regular,
        weight: Font.Normal
    })
    property font iSubTitle2: Qt.font({
        pixelSize: 14*density,
        letterSpacing: 0.1,
        family: sifontype.roboto_medium,
        weight: Font.Medium
    })
    property font iBody1: Qt.font({
        pixelSize: 16*density,
        letterSpacing: 0.5,
        family: sifontype.roboto_regular,
        weight: Font.Normal
    })
    property font iBody2: Qt.font({
        pixelSize: 14*density,
        letterSpacing: 0.25,
        family: sifontype.roboto_regular,
        weight: Font.Normal
    })
    property font iButton: Qt.font({
        pixelSize: 14*density,
        letterSpacing: 1.25,
        capitalization: Font.AllUppercase,
        family: sifontype.roboto_medium,
        weight: Font.Medium
    })
    property font iCaption: Qt.font({
        pixelSize: 12*density,
        letterSpacing: 0.4,
        family: sifontype.roboto_regular,
        weight: Font.Normal
    })
    property font iOverLine: Qt.font({
        pixelSize: 10*density,
        letterSpacing: 1.25,
        capitalization: Font.AllUppercase,
        family: sifontype.roboto_regular,
        weight: Font.Normal
    })

}
