Class {
	#name : #CVGAwardReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGAwardReader class >> readFromDictionary: dic [

	| cordee |
	cordee := CVGAward new.
	cordee title: (self readStringProperty: #title in: dic).
	cordee authorsList: (dic at: #authorsList).
	cordee year: (dic at: #year).
	cordee conference: (dic at: #conference).
	cordee awardName: (dic at: #awardName).
	^ cordee
]
