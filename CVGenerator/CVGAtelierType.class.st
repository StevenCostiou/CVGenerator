Class {
	#name : #CVGAtelierType,
	#superclass : #CVGAdditionalTeachingType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'accessing - defaults' }
CVGAtelierType >> isAtelier [ ^true
]

{ #category : #'accessing - defaults' }
CVGAtelierType >> typeKey [
	^#ateliers
]

{ #category : #'accessing - defaults' }
CVGAtelierType >> typeName [
	^'Ateliers'
]
