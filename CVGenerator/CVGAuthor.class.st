"
I represent a publication author.
I am ""self"" if I am the same author as the one in the current Pharo image.
"
Class {
	#name : #CVGAuthor,
	#superclass : #CVGSectionElement,
	#instVars : [
		'name',
		'surname'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #accessing }
CVGAuthor class >> readerClass [
	^ CVGAuthorReader
]

{ #category : #accessing }
CVGAuthor >> fullName [ 
	^name, ' ', surname
]

{ #category : #testing }
CVGAuthor >> isSelf [
	^ (name , surname) = Author uniqueInstance fullName
]

{ #category : #accessing }
CVGAuthor >> name [
	^ name
]

{ #category : #accessing }
CVGAuthor >> name: anObject [
	name := anObject
]

{ #category : #accessing }
CVGAuthor >> surname [
	^ surname
]

{ #category : #accessing }
CVGAuthor >> surname: anObject [
	surname := anObject
]
