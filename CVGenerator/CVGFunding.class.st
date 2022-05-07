Class {
	#name : #CVGFunding,
	#superclass : #CVGSectionElement,
	#instVars : [
		'name',
		'years',
		'url',
		'description',
		'money'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #accessing }
CVGFunding >> description [

	^ description
]

{ #category : #accessing }
CVGFunding >> description: anObject [

	description := anObject
]

{ #category : #accessing }
CVGFunding >> money [

	^ money
]

{ #category : #accessing }
CVGFunding >> money: anObject [

	money := anObject
]

{ #category : #accessing }
CVGFunding >> name [

	^ name
]

{ #category : #accessing }
CVGFunding >> name: anObject [

	name := anObject
]

{ #category : #accessing }
CVGFunding >> url [

	^ url
]

{ #category : #accessing }
CVGFunding >> url: anObject [

	url := anObject
]

{ #category : #accessing }
CVGFunding >> years [

	^ years
]

{ #category : #accessing }
CVGFunding >> years: anObject [

	years := anObject
]
