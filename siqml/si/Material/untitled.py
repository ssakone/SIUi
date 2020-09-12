import os
import sys
import pprint 
try:
	fn = os.listdir(sys.argv[1])
	fn.remove("qmldir")
	converted = []
	[converted.append('qmlRegisterType(QUrl("qrc:/qml/si/{0}/{1}.qml"),"si.{0}",{2},{3},"{1}");'.format(sys.argv[1],element.split(".")[0],sys.argv[2].split(".")[0],sys.argv[2].split(".")[1])) for element in fn]
	print("\n".join(converted))

except Exception as e:
	print("Argument Error {}".format(e))
