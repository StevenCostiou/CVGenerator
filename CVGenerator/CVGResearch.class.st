Class {
	#name : #CVGResearch,
	#superclass : #CVGResearchWorkType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGResearch >> isResearch [ 
	^true
]

{ #category : #'accessing - defaults' }
CVGResearch >> typeKey [
	^#research
]

{ #category : #'accessing - defaults' }
CVGResearch >> typeName [
	^ 'Research'
]
