Class {
	#name : #CVGAdditionalTeachingCapReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGAdditionalTeachingCapReader class >> readFromDictionary: dic [

	|course|
	course := CVGCourse new.
	course type: (CVGTeachingType type: (self readSymbolProperty: #type in: dic)).
	course institute: (dic at: #institute).
	course title: (self readStringProperty: #name in: dic).
	course year: (dic at: #year).
	course level: (dic at: #level).
	course cm: (dic at: #cm).
	course td: (dic at: #td).
	course tp: (dic at: #tp).
	course responsible: (dic at: #responsible).
	course link: (self readStringProperty: #link in: dic).	
	^course
]
