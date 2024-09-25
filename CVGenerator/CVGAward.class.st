Class {
	#name : #CVGAward,
	#superclass : #CVGSectionElement,
	#instVars : [
		'authorsList',
		'conference',
		'year',
		'awardName'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'as yet unclassified' }
CVGAward class >> generate: section with: aGenerator using: writer [
	^aGenerator generateAwardsSection: section with: writer
]

{ #category : #accessing }
CVGAward class >> readerClass [
	^ CVGAwardReader
]

{ #category : #accessing }
CVGAward >> authorsList [

	^ authorsList
]

{ #category : #accessing }
CVGAward >> authorsList: anObject [

	authorsList := anObject
]

{ #category : #accessing }
CVGAward >> awardName [

	^ awardName
]

{ #category : #accessing }
CVGAward >> awardName: anObject [

	awardName := anObject
]

{ #category : #accessing }
CVGAward >> conference [

	^ conference
]

{ #category : #accessing }
CVGAward >> conference: anObject [

	conference := anObject
]

{ #category : #accessing }
CVGAward >> year [

	^ year
]

{ #category : #accessing }
CVGAward >> year: anObject [

	year := anObject
]
