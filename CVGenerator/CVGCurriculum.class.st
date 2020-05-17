"
I represent a full CV
"
Class {
	#name : #CVGCurriculum,
	#superclass : #Object,
	#instVars : [
		'path',
		'publications',
		'sections'
	],
	#category : #'CVGenerator-core'
}

{ #category : #'api - publications' }
CVGCurriculum >> allBooks [
	^ publications
		select: [ :pub | pub isBook]
]

{ #category : #'api - publications' }
CVGCurriculum >> allConferences [
	^ publications
		select: [ :pub | pub isConference ]
]

{ #category : #'api - publications' }
CVGCurriculum >> allJournals [
	^ publications
		select: [ :pub | pub isJournal ]
]

{ #category : #'api - publications' }
CVGCurriculum >> allOtherPublications [
	^ publications
		select: [ :pub | pub isOther ]
]

{ #category : #software }
CVGCurriculum >> allSoftware [
]

{ #category : #'api - publications' }
CVGCurriculum >> allTheses [
	^ publications
		select: [ :pub | pub isThesis ]
]

{ #category : #'api - publications' }
CVGCurriculum >> allWorkshops [
	^ publications
		select: [ :pub | pub isWorkshop ]
]

{ #category : #materializing }
CVGCurriculum >> materialize [
	sections := Dictionary new.
	publications := (self materializeDataFrom: 'publications.ston')
		collect: [ :dic | CVGPublicationReader readFromDictionary: dic ]
]

{ #category : #materializing }
CVGCurriculum >> materializeDataFrom: aString [
	^ STON fromString: (path , '/' , aString) asFileReference contents
]

{ #category : #accessing }
CVGCurriculum >> path: aPath [
	path := aPath
]