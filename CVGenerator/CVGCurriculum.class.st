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

{ #category : #materializing }
CVGCurriculum class >> materializeFrom: aPath [
	^ self new
		path: aPath;
		materialize
]

{ #category : #'api - publications' }
CVGCurriculum >> allBooks [
	^ self publications select: [ :pub | pub isBook ]
]

{ #category : #'api - publications' }
CVGCurriculum >> allConferences [
	^ self publications select: [ :pub | pub isConference ]
]

{ #category : #'api - publications' }
CVGCurriculum >> allJournals [
	^ self publications select: [ :pub | pub isJournal ]
]

{ #category : #'api - publications' }
CVGCurriculum >> allOtherPublications [
	^ self publications select: [ :pub | pub isOther ]
]

{ #category : #software }
CVGCurriculum >> allSoftware [
]

{ #category : #'api - publications' }
CVGCurriculum >> allTheses [
	^ self publications select: [ :pub | pub isThesis ]
]

{ #category : #'api - publications' }
CVGCurriculum >> allWorkshops [
	^ self publications select: [ :pub | pub isWorkshop ]
]

{ #category : #sections }
CVGCurriculum >> findSection: aSectionType [
	^ sections
		detect: [ :sec | sec type = aSectionType ]
		ifNone: [ OrderedCollection new ]
]

{ #category : #generation }
CVGCurriculum >> generateHTML [
	^ CVGGenerator generateHTML: self
]

{ #category : #materializing }
CVGCurriculum >> materialize [
	sections := (self materializeDataFrom: 'sections.ston')
		collect: [ :dic | CVGSectionReader readFromDictionary: dic ].
	sections do: [ :sec | self materializeSectionData: sec ]
]

{ #category : #materializing }
CVGCurriculum >> materializeDataFrom: aString [
	^ STON fromString: (path , '/' , aString) asFileReference contents
]

{ #category : #materializing }
CVGCurriculum >> materializeSectionData: sec [
	| stonData data |
	stonData := self materializeDataFrom: sec dataPathFilename.
	data := stonData
		collect: [ :dic | sec type readerClass readFromDictionary: dic ].
	sec data: data
]

{ #category : #accessing }
CVGCurriculum >> path: aPath [
	path := aPath
]

{ #category : #'api - publications' }
CVGCurriculum >> publications [
	^ (self findSection: CVGPublication) data
]

{ #category : #'api - publications' }
CVGCurriculum >> sortedPublications [
	^ {(CVGPublicationType journal -> self allJournals).
	(CVGPublicationType conference -> self allConferences).
	(CVGPublicationType workshop -> self allWorkshops).
	(CVGPublicationType book -> self allBooks).
	(CVGPublicationType other -> self allOtherPublications).
	(CVGPublicationType thesis -> self allTheses)}
]
