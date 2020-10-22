Class {
	#name : #CVGCordee,
	#superclass : #CVGTextTranslatedSectionElement,
	#instVars : [
		'year',
		'award',
		'thumb',
		'images',
		'press',
		'poster',
		'students',
		'school'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #visiting }
CVGCordee >> acceptGenerator: aCVGGenerator [
	aCVGGenerator generateCordee: self
]

{ #category : #accessing }
CVGCordee >> award [
	^ award
]

{ #category : #accessing }
CVGCordee >> award: anObject [
	award := anObject
]

{ #category : #accessing }
CVGCordee >> images [
	^ images
]

{ #category : #accessing }
CVGCordee >> images: anObject [
	images := anObject
]

{ #category : #accessing }
CVGCordee >> poster [
	^ poster
]

{ #category : #accessing }
CVGCordee >> poster: anObject [
	poster := anObject
]

{ #category : #accessing }
CVGCordee >> press [
	^ press
]

{ #category : #accessing }
CVGCordee >> press: anObject [
	press := anObject
]

{ #category : #accessing }
CVGCordee >> school [
	^ school
]

{ #category : #accessing }
CVGCordee >> school: anObject [
	school := anObject
]

{ #category : #accessing }
CVGCordee >> students [
	^ students
]

{ #category : #accessing }
CVGCordee >> students: anObject [
	students := anObject
]

{ #category : #accessing }
CVGCordee >> thumb [
	^ thumb
]

{ #category : #accessing }
CVGCordee >> thumb: anObject [
	thumb := anObject
]

{ #category : #accessing }
CVGCordee >> year [
	^ year
]

{ #category : #accessing }
CVGCordee >> year: anObject [
	year := anObject
]
