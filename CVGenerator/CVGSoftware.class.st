"
I represent a software artefact.

type = developer or contributor
"
Class {
	#name : #CVGSoftware,
	#superclass : #CVGSectionElement,
	#instVars : [
		'yearStart',
		'yearStop',
		'description',
		'image',
		'link'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'data sorting' }
CVGSoftware class >> allContributedSoftwareIn: flattenedData [
	^ flattenedData select: [ :data | data isContributor ]
]

{ #category : #'data sorting' }
CVGSoftware class >> allDevelopedSoftwareIn: flattenedData [
	^ flattenedData select: [ :data | data isDeveloper ]
]

{ #category : #'as yet unclassified' }
CVGSoftware class >> generate: section with: aGenerator using: writer [
	^aGenerator generateContributionSection: section with: writer
]

{ #category : #accessing }
CVGSoftware class >> htmlWriterClass [
	^ CVGHtmlSoftwareWriter 
]

{ #category : #accessing }
CVGSoftware class >> latexWriterClass [
	 ^CVGLatexContributionWriter 
]

{ #category : #accessing }
CVGSoftware class >> readerClass [ 	
	^CVGSoftwareReader 
]

{ #category : #'data sorting' }
CVGSoftware class >> sortedElements: flattenedData [

	^ {(CVGSoftwareType developer -> (self allDevelopedSoftwareIn: flattenedData)).
	(CVGSoftwareType contributor -> (self allContributedSoftwareIn: flattenedData)).}
]

{ #category : #accessing }
CVGSoftware >> description [
	^ description
]

{ #category : #accessing }
CVGSoftware >> description: anObject [
	description := anObject
]

{ #category : #accessing }
CVGSoftware >> descriptionEnglish [
	^ description second
]

{ #category : #accessing }
CVGSoftware >> image [
	^ image
]

{ #category : #accessing }
CVGSoftware >> image: anObject [
	image := anObject
]

{ #category : #testing }
CVGSoftware >> isContributor [ ^type isContributor
]

{ #category : #testing }
CVGSoftware >> isDeveloper [ ^type isDeveloper
]

{ #category : #accessing }
CVGSoftware >> link [
	^ link
]

{ #category : #accessing }
CVGSoftware >> link: anObject [
	link := anObject
]

{ #category : #accessing }
CVGSoftware >> yearStart [
	^ yearStart
]

{ #category : #accessing }
CVGSoftware >> yearStart: anObject [
	yearStart := anObject
]

{ #category : #accessing }
CVGSoftware >> yearStop [
	^ yearStop
]

{ #category : #accessing }
CVGSoftware >> yearStop: anObject [
	yearStop := anObject
]
