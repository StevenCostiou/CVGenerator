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

{ #category : #sections }
CVGCurriculum >> findSection: aSectionType [
	^ sections
		detect: [ :sec | sec type = aSectionType ]
		ifNone: [ OrderedCollection new ]
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

{ #category : #accessing }
CVGCurriculum >> sections [
	^sections
]
