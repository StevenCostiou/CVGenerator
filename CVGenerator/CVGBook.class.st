"
I represent books and booklets publication types
"
Class {
	#name : #CVGBook,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGBook >> isBook [
	^true
]

{ #category : #'accessing - defaults' }
CVGBook >> typeKey [
	^#book2
]

{ #category : #'accessing - defaults' }
CVGBook >> typeName [
	"^#('Livres' 'Books')"
	^#('Conférences nationales' 'French national conferences')
]
