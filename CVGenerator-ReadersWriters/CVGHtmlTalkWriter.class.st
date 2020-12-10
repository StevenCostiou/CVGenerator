"
I specialize specific writing behavior for HTML themes
"
Class {
	#name : #CVGHtmlTalkWriter,
	#superclass : #CVGSimpleHtmlWriter,
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #lists }
CVGHtmlTalkWriter >> closeItemList [
	self stopOrderedList 
]

{ #category : #lists }
CVGHtmlTalkWriter >> openItemList [
	self startOrderedList 
]

{ #category : #sections }
CVGHtmlTalkWriter >> section: aString [

	stream << '<div class="paper">'.
	stream << '<i class="material-icons" style="color:#1565c0">mic</i>'.
	super section: aString.
	stream << '</div>'
]

{ #category : #sections }
CVGHtmlTalkWriter >> subSection: aString [
	self title: aString h: 'h5' class: 'blue-title'.
	"stream << '<hr class=""blue-hr"">'"

]

{ #category : #links }
CVGHtmlTalkWriter >> url: aString labeled: aName [
	|str|
	str := WriteStream on: String new.
	str << '<a href="'.
	str << aString.
	str << '" target=_blank>'.
	str << '<i class="material-icons md-18">link</i>'.
	str << '</a>'.
	self span: str contents class: 'paper-pdf'
]

{ #category : #sections }
CVGHtmlTalkWriter >> writeContributionNumbers: anInteger [
	stream << anInteger printString.
	stream space.
	stream << ' talks.'.
	stream << '</br>'
]
