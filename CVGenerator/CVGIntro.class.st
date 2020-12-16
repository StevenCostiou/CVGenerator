Class {
	#name : #CVGIntro,
	#superclass : #CVGSectionElement,
	#instVars : [
		'keywords',
		'text'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'as yet unclassified' }
CVGIntro class >> generate: section with: aGenerator using: writer [
	^aGenerator generateIntroSection: section with: writer
]

{ #category : #accessing }
CVGIntro class >> readerClass [
	^ CVGIntroReader
]

{ #category : #accessing }
CVGIntro >> keywords [
	^ keywords
]

{ #category : #accessing }
CVGIntro >> keywords: anObject [
	keywords := anObject
]

{ #category : #accessing }
CVGIntro >> text [
	^ text
]

{ #category : #accessing }
CVGIntro >> text: anObject [
	text := anObject
]
