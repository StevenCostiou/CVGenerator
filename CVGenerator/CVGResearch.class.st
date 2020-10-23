Class {
	#name : #CVGResearch,
	#superclass : #CVGTextTranslatedSectionElement,
	#instVars : [
		'dateString'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #accessing }
CVGResearch class >> readerClass [
	^ CVGResearchReader 
]

{ #category : #accessing }
CVGResearch >> dateString [
	^ dateString
]

{ #category : #accessing }
CVGResearch >> dateString: anObject [
	dateString := anObject
]
