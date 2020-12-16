"
I represent conferences publication type
"
Class {
	#name : #CVGConference,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGConference >> isConference [
	^ true
]

{ #category : #'accessing - defaults' }
CVGConference >> typeKey [
	^#conference
]

{ #category : #'accessing - defaults' }
CVGConference >> typeName [
	^#('Conférences internationales' 'Conferences')
]
