"
I represent a course.

type = lecture
"
Class {
	#name : #CVGCourse,
	#superclass : #CVGSectionElement,
	#instVars : [
		'institute',
		'year',
		'name',
		'level',
		'cm',
		'td',
		'tp',
		'responsible',
		'link'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'as yet unclassified' }
CVGCourse class >> generate: section with: aGenerator using: writer [
	^aGenerator generateTeachingsSection: section with: writer
]

{ #category : #accessing }
CVGCourse class >> readerClass [
	^ CVGCourseReader 
]

{ #category : #visiting }
CVGCourse >> acceptGenerator: aCVGGenerator [
	aCVGGenerator generateCourse: self
]

{ #category : #accessing }
CVGCourse >> cm [
	^ cm
]

{ #category : #accessing }
CVGCourse >> cm: anObject [
	cm := anObject
]

{ #category : #accessing }
CVGCourse >> institute [
	^ institute
]

{ #category : #accessing }
CVGCourse >> institute: anObject [
	institute := anObject
]

{ #category : #accessing }
CVGCourse >> instituteEnglish [
	^ institute second
]

{ #category : #accessing }
CVGCourse >> level [
	^ level
]

{ #category : #accessing }
CVGCourse >> level: anObject [
	level := anObject
]

{ #category : #accessing }
CVGCourse >> levelEnglish [
	^ level second
]

{ #category : #accessing }
CVGCourse >> link [
	^ link
]

{ #category : #accessing }
CVGCourse >> link: anObject [
	link := anObject
]

{ #category : #accessing }
CVGCourse >> name [
	^ name first
]

{ #category : #accessing }
CVGCourse >> name: anObject [
	name := anObject
]

{ #category : #accessing }
CVGCourse >> nameEnglish [
	^ name second
]

{ #category : #accessing }
CVGCourse >> responsible [
	^ responsible
]

{ #category : #accessing }
CVGCourse >> responsible: anObject [
	responsible := anObject
]

{ #category : #accessing }
CVGCourse >> td [
	^ td
]

{ #category : #accessing }
CVGCourse >> td: anObject [
	td := anObject
]

{ #category : #accessing }
CVGCourse >> totalEquivalentTD [
	^ (cm * 1.5 + td + (tp * 2 / 3)) rounded
]

{ #category : #computing }
CVGCourse >> totalHours [
	^cm + td + tp
]

{ #category : #accessing }
CVGCourse >> tp [
	^ tp
]

{ #category : #accessing }
CVGCourse >> tp: anObject [
	tp := anObject
]

{ #category : #accessing }
CVGCourse >> year [
	^ year first
]

{ #category : #accessing }
CVGCourse >> year: anObject [
	year := anObject
]

{ #category : #computing }
CVGCourse >> yearLabel [
	^year second
]
