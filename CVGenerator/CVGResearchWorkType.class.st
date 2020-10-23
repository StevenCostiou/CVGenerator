Class {
	#name : #CVGResearchWorkType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGResearchWorkType class >> collaboration [  
	^CVGCollaboration new
]

{ #category : #'as yet unclassified' }
CVGResearchWorkType class >> research [ 
	^CVGResearch new
]

{ #category : #testing }
CVGResearchWorkType >> isCollaboration [
	^false
]

{ #category : #testing }
CVGResearchWorkType >> isResearch [
	^false
]
