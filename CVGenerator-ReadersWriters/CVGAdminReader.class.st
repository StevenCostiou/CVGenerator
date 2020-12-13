Class {
	#name : #CVGAdminReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGAdminReader class >> readFromDictionary: dic [

	|admin|
	admin := CVGAdmin new.
	admin type: (CVGAdminType type: (self readSymbolProperty: #type in: dic)).
	admin title: (dic at: #name).
	admin institute: (dic at: #institute ifAbsent:['']).
	admin years: (dic at: #years ifAbsent:['']).
	admin election: (dic at: #election ifAbsent:['']).
	admin items: (dic at: #items ifAbsent:['']).
	admin over: (dic at: #over ifAbsent: [false]).
	^admin
]
