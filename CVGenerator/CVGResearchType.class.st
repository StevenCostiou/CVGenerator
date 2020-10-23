Class {
	#name : #CVGResearchType,
	#superclass : #CVGResearchWorkType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGResearchType >> isResearch [ 
	^true
]

{ #category : #'accessing - defaults' }
CVGResearchType >> typeKey [
	^#research
]

{ #category : #'accessing - defaults' }
CVGResearchType >> typeName [
	^ 'Research'
]
