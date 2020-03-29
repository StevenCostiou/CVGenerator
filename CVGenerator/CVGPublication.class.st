"
I represent a publication.

type = journal, conference, workshop, book, thesis, other
"
Class {
	#name : #CVGPublication,
	#superclass : #Object,
	#instVars : [
		'type',
		'title',
		'authors',
		'publisher',
		'year',
		'doi',
		'link'
	],
	#category : #CVGenerator
}

{ #category : #accessing }
CVGPublication >> authors [
	^ authors
]

{ #category : #accessing }
CVGPublication >> authors: anObject [
	authors := anObject
]

{ #category : #accessing }
CVGPublication >> doi [
	^ doi
]

{ #category : #accessing }
CVGPublication >> doi: anObject [
	doi := anObject
]

{ #category : #accessing }
CVGPublication >> link [
	^ link
]

{ #category : #accessing }
CVGPublication >> link: anObject [
	link := anObject
]

{ #category : #accessing }
CVGPublication >> publisher [
	^ publisher
]

{ #category : #accessing }
CVGPublication >> publisher: anObject [
	publisher := anObject
]

{ #category : #accessing }
CVGPublication >> title [
	^ title
]

{ #category : #accessing }
CVGPublication >> title: anObject [
	title := anObject
]

{ #category : #accessing }
CVGPublication >> type [
	^ type
]

{ #category : #accessing }
CVGPublication >> type: anObject [
	type := anObject
]

{ #category : #accessing }
CVGPublication >> year [
	^ year
]

{ #category : #accessing }
CVGPublication >> year: anObject [
	year := anObject
]
