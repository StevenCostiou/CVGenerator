Class {
	#name : #CVGResearch,
	#superclass : #CVGTextTranslatedSectionElement,
	#instVars : [
		'dateString'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'as yet unclassified' }
CVGResearch class >> generate: section with: aGenerator using: writer [
	^aGenerator generateResearchSection: section with: writer
]

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
