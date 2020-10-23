Class {
	#name : #CVGResearchWorkType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGResearchWorkType class >> collaboration [  
	^CVGCollaborationType new
]

{ #category : #'as yet unclassified' }
CVGResearchWorkType class >> research [ 
	^CVGResearchType new
]

{ #category : #testing }
CVGResearchWorkType >> isCollaboration [
	^false
]

{ #category : #testing }
CVGResearchWorkType >> isResearch [
	^false
]
