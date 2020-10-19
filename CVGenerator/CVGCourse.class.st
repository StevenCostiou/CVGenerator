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
		'responsible'
	],
	#category : #'CVGenerator-elements'
}

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
	^ institute first
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
	^ level first
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
	^ (cm * 1.5 + td + (tp * 3 / 2)) rounded
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
