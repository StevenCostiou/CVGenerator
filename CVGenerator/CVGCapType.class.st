Class {
	#name : #CVGCapType,
	#superclass : #CVGAdditionalTeachingType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGCapType >> isCap [ 
	^true
]

{ #category : #'accessing - defaults' }
CVGCapType >> typeKey [
	^#cap
]

{ #category : #'accessing - defaults' }
CVGCapType >> typeName [
	 ^'Section cap'
]
