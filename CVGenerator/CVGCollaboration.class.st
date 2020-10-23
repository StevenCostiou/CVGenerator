Class {
	#name : #CVGCollaboration,
	#superclass : #CVGResearchWorkType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGCollaboration >> isCollaboration [ 
	^true
]

{ #category : #'accessing - defaults' }
CVGCollaboration >> typeKey [
	^ #collaboration
]

{ #category : #'accessing - defaults' }
CVGCollaboration >> typeName [
	^ 'Collaboration'
]
