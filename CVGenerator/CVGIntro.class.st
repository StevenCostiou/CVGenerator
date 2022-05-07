Class {
	#name : #CVGIntro,
	#superclass : #CVGSectionElement,
	#instVars : [
		'keywords',
		'text',
		'fundings'
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
CVGIntro >> fundings [

	^ fundings
]

{ #category : #accessing }
CVGIntro >> fundings: anObject [

	fundings := anObject
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
