Class {
	#name : #CVGStudentReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGStudentReader class >> readFromDictionary: dic [
	| student |
	student := CVGStudent new.
	student description: (dic at: #description ifAbsent: [ nil ]).
	student title: (dic at: #title ifAbsent: [ nil ]).
	student name: (dic at: #name ifAbsent: [ nil ]).
	student yearStart: (dic at: #yearStart ifAbsent: [ nil ]).
	student level: (dic at: #level ifAbsent: [ nil ]).
	student funding: (dic at: #funding ifAbsent: [ nil ]).
	student duration: (dic at: #duration ifAbsent: [ nil ]).
	student yearStop: (dic at: #yearStop ifAbsent: [ nil ]).
	student school: (dic at: #school ifAbsent: [ nil ]).
	student type:(CVGStudentType type: (dic at: #type ifAbsent: [ nil ])).
	student academic: (dic at: #academic ifAbsent: [ nil ]).
	^ student
]
