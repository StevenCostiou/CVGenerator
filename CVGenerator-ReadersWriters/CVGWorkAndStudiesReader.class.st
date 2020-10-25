Class {
	#name : #CVGWorkAndStudiesReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGWorkAndStudiesReader class >> readFromDictionary: dic [
	| xp |
	xp := CVGWorkStudy new.
	xp institution: (dic at: #institution ifAbsent: [ nil ]).
	xp stop: (dic at: #stop ifAbsent: [ nil ]).
	xp title: (dic at: #title ifAbsent: [ nil ]).
	xp type: (CVGWorkStudyType type: (dic at: #type ifAbsent: [ nil ])).
	xp start: (dic at: #start ifAbsent: [ nil ]).
	xp duration: (dic at: #duration ifAbsent: [ nil ]).
	^ xp
]
