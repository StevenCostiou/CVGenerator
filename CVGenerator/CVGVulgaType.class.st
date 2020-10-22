Class {
	#name : #CVGVulgaType,
	#superclass : #CVGAdditionalTeachingType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGVulgaType >> isVulga [ 
	^true
]

{ #category : #'accessing - defaults' }
CVGVulgaType >> typeKey [
	^#vulga
]

{ #category : #'accessing - defaults' }
CVGVulgaType >> typeName [
 ^'Vulgarization'
]
