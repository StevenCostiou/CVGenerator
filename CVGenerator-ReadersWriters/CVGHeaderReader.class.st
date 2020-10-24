Class {
	#name : #CVGHeaderReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGHeaderReader class >> readFromDictionary: dic [
	| header |
	header := CVGHeader new.
	header rank: (dic at: #rank ifAbsent: [ nil ]).
	header team: (dic at: #team ifAbsent: [ nil ]).
	header lab: (dic at: #lab ifAbsent: [ nil ]).
	header institution: (dic at: #institution ifAbsent: [ nil ]).
	header title: (dic at: #title ifAbsent: [ nil ]).
	header type: (dic at: #type ifAbsent: [ nil ]).
	header photo: (dic at: #photo ifAbsent: [ nil ]).
	^ header
]
