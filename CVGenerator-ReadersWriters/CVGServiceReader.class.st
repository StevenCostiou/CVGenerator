Class {
	#name : #CVGServiceReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGServiceReader class >> readFromDictionary: dic [
	| service |
	service := CVGService new.
	service
		type: (CVGServiceType type: (self readSymbolProperty: #type in: dic)).
	service title: (dic at: #name).
	service medium: (dic at: #medium ifAbsent: [ '' ]).
	service years: (dic at: #years ifAbsent: [ '' ]).
	service acronym: (dic at: #acronym ifAbsent: [ '' ]).
	service url: (dic at: #url ifAbsent: [ '' ]).
	^ service
]
