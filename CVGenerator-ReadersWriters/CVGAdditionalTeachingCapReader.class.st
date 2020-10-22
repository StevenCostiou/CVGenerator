Class {
	#name : #CVGAdditionalTeachingCapReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGAdditionalTeachingCapReader class >> readFromDictionary: dic [

	|cap|
	cap := CVGCourse new.
	cap type: (CVGTeachingType type: (self readSymbolProperty: #type in: dic)).
	cap institute: (dic at: #institute).
	cap title: (self readStringProperty: #name in: dic).
	cap year: (dic at: #year).
	cap level: (dic at: #level).
	cap cm: (dic at: #cm).
	cap td: (dic at: #td).
	cap tp: (dic at: #tp).
	cap responsible: (dic at: #responsible).
	cap link: (self readStringProperty: #link in: dic).	
	^cap
]
