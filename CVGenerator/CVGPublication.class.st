"
I represent a publication.

type = journal, conference, workshop, book, thesis, other
"
Class {
	#name : #CVGPublication,
	#superclass : #CVGSectionElement,
	#instVars : [
		'authors',
		'publisher',
		'year',
		'doi',
		'link',
		'highlight'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'data - sorting' }
CVGPublication class >> allBooksIn: flattenedData [
	^ flattenedData select: [ :pub | pub isBook ]
]

{ #category : #'data - sorting' }
CVGPublication class >> allConferencesIn: flattenedData [
	^ flattenedData select: [ :pub | pub isConference ]
]

{ #category : #'data - sorting' }
CVGPublication class >> allJournalsIn: flattenedData [
	^ flattenedData select: [ :pub | pub isJournal ]
]

{ #category : #'data - sorting' }
CVGPublication class >> allOtherPublicationsIn: flattenedData [
	^ flattenedData select: [ :pub | pub isOther ]
]

{ #category : #'data - sorting' }
CVGPublication class >> allThesesIn: flattenedData [
	^ flattenedData select: [ :pub | pub isThesis ]
]

{ #category : #'data - sorting' }
CVGPublication class >> allWorkshopsIn: flattenedData [
	^ flattenedData select: [ :pub | pub isWorkshop ]
]

{ #category : #'as yet unclassified' }
CVGPublication class >> generate: section with: aGenerator using: writer [
	^aGenerator generateContributionSectionBydate: section with: writer
]

{ #category : #accessing }
CVGPublication class >> htmlWriterClass [
	^ CVGHtmlPublicationWriter 
]

{ #category : #accessing }
CVGPublication class >> latexWriterClass [
	 ^CVGLatexContributionWriter 
]

{ #category : #accessing }
CVGPublication class >> readerClass [
	^ CVGPublicationReader
]

{ #category : #'data - sorting' }
CVGPublication class >> sortedElements: flattenedData [

	^ {(CVGPublicationType journal -> (self allJournalsIn: flattenedData)).
	(CVGPublicationType conference -> (self allConferencesIn: flattenedData)).
	(CVGPublicationType book2 -> (self allBooksIn: flattenedData)).
	(CVGPublicationType workshop -> (self allWorkshopsIn: flattenedData)).
	(CVGPublicationType other -> (self allOtherPublicationsIn: flattenedData)).
	(CVGPublicationType thesis -> (self allThesesIn: flattenedData))}
]

{ #category : #'data - sorting' }
CVGPublication class >> sortedElementsByDate: flattenedData [

	^ flattenedData groupedBy: #year
]

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
CVGPublication >> highlight [

	^ highlight
]

{ #category : #accessing }
CVGPublication >> highlight: anObject [

	highlight := anObject
]

{ #category : #testing }
CVGPublication >> isBook [ ^type isBook
]

{ #category : #testing }
CVGPublication >> isConference [ ^type isConference
]

{ #category : #testing }
CVGPublication >> isJournal [ ^type isJournal
]

{ #category : #testing }
CVGPublication >> isOther [ ^type isOther
]

{ #category : #testing }
CVGPublication >> isThesis [ ^type isThesis
]

{ #category : #testing }
CVGPublication >> isWorkshop [ ^type isWorkshop
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
CVGPublication >> year [
	^ year
]

{ #category : #accessing }
CVGPublication >> year: anObject [
	year := anObject
]
