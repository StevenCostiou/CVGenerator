Class {
	#name : #CVGCollaborationType,
	#superclass : #CVGResearchWorkType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGCollaborationType >> isCollaboration [ 
	^true
]

{ #category : #'accessing - defaults' }
CVGCollaborationType >> typeKey [
	^ #collaboration
]

{ #category : #'accessing - defaults' }
CVGCollaborationType >> typeName [
	^ 'Collaboration'
]
