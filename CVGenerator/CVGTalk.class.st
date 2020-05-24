"
Gen code:
{
'Keynote'->'Keynotes'.
'Tool'->'Tool presentations'.
'Conference'->'International conferences'.
'Vulgarization'->'Vulgarization'.
'Seminar'->'Academic and industrial seminars'.
} do:[:talkType|	
	|className class typeKey typeName accessor testAccessor|
	className := ('CVGTalk', talkType key) asSymbol.
	typeKey := talkType key asLowercase asSymbol.
	typeName := talkType value.
	testAccessor := ('is', talkType key) asSymbol.
	accessor := typeKey.
	
	CVGTalkType compile: (testAccessor, ' ^false').
	
	class := CVGTalkType subclass: className
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'CVGenerator-elements - types'.
	
	CVGTalk compile: (testAccessor asString, ' ^type ', testAccessor).
	class compile: (testAccessor asString, ' ^true').
	class compile: ('typeKey ^', typeKey printString).
	class compile: ('typeName ^', typeName printString).
	
	CVGTalkType class compile: (accessor asString, ' ^', class name, ' new')
].

types := (CVGTalkType allSubclasses collect:[:c| c new]).
types do:[:c|
	|typeName|
	typeName := c typeKey asString capitalized.
	CVGTalk class compile: 
	'all', typeName, 'sIn: flattenedData
		^flattenedData select: [ :e | e is',typeName, ']'	
		].
str := String new writeStream.
str << 'sortedElements: flattenedData'.
str cr.
str << '^{'.
types do:[:t|
	str << '('.
	str << (t class name).
	str space.
	str << (t typeKey).
	str << '->'.
	str << '( self all'.
	str << (t typeKey asString capitalized).
	str << 'sIn: flattenedData)'.
	str << ').'.
	].	

str << '}'.
CVGTalk class compile: str contents
 
"
Class {
	#name : #CVGTalk,
	#superclass : #CVGSectionElement,
	#instVars : [
		'date',
		'description',
		'location',
		'link'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'data - sorting' }
CVGTalk class >> allConferencesIn: flattenedData [
		^flattenedData select: [ :e | e isConference]
]

{ #category : #'data - sorting' }
CVGTalk class >> allKeynotesIn: flattenedData [
		^flattenedData select: [ :e | e isKeynote]
]

{ #category : #'data - sorting' }
CVGTalk class >> allSeminarsIn: flattenedData [
		^flattenedData select: [ :e | e isSeminar]
]

{ #category : #'data - sorting' }
CVGTalk class >> allToolsIn: flattenedData [
		^flattenedData select: [ :e | e isTool]
]

{ #category : #'data - sorting' }
CVGTalk class >> allVulgarizationsIn: flattenedData [
		^flattenedData select: [ :e | e isVulgarization]
]

{ #category : #accessing }
CVGTalk class >> htmlWriterClass [
	^ CVGHtmlTalkWriter 
]

{ #category : #accessing }
CVGTalk class >> readerClass [
	^ CVGTalkReader
]

{ #category : #'data - sorting' }
CVGTalk class >> sortedElements: flattenedData [
	^ {
	(CVGTalkKeynote keynote -> (self allKeynotesIn: flattenedData)).	
	(CVGTalkConference conference	-> (self allConferencesIn: flattenedData)).
	(CVGTalkTool tool -> (self allToolsIn: flattenedData)).
	(CVGTalkVulgarization vulgarization -> (self allVulgarizationsIn: flattenedData)).
	(CVGTalkSeminar seminar -> (self allSeminarsIn: flattenedData))
	}
]

{ #category : #accessing }
CVGTalk >> date [
	^ date
]

{ #category : #accessing }
CVGTalk >> date: anObject [
	date := anObject
]

{ #category : #accessing }
CVGTalk >> description [
	^ description
]

{ #category : #accessing }
CVGTalk >> description: anObject [
	description := anObject
]

{ #category : #testing }
CVGTalk >> isConference [ ^type isConference
]

{ #category : #testing }
CVGTalk >> isKeynote [ ^type isKeynote
]

{ #category : #testing }
CVGTalk >> isSeminar [ ^type isSeminar
]

{ #category : #testing }
CVGTalk >> isTool [ ^type isTool
]

{ #category : #testing }
CVGTalk >> isVulgarization [ ^type isVulgarization
]

{ #category : #accessing }
CVGTalk >> link [
	^ link
]

{ #category : #accessing }
CVGTalk >> link: anObject [
	link := anObject
]

{ #category : #accessing }
CVGTalk >> location [
	^ location
]

{ #category : #accessing }
CVGTalk >> location: anObject [
	location := anObject
]
