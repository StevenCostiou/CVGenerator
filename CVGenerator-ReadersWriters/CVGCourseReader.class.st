"
I am a utility class.
I instantiate a CVGCourse from a dictionary representing a CVGCourse instance.
"
Class {
	#name : #CVGCourseReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGCourseReader class >> readFromDictionary: dic [

	|course|
	course := CVGCourse new.
	course type: (CVGTalkType type: (self readSymbolProperty: #type in: dic)).
	course institute: (dic at: #institute).	
	course year: (dic at: #year).
	course level: (dic at: #level).
	course cm: (dic at: #cm).
	course td: (dic at: #td).
	course tp: (dic at: #tp).
	course responsible: (dic at: #responsible).
	course link: (self readStringProperty: #link in: dic).	
	^course
]
