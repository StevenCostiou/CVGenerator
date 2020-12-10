"
I specialize specific writing behavior for HTML themes
"
Class {
	#name : #CVGHtmlPublicationWriter,
	#superclass : #CVGSimpleHtmlWriter,
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #lists }
CVGHtmlPublicationWriter >> closeItemList [
	self stopOrderedList 
]

{ #category : #lists }
CVGHtmlPublicationWriter >> openItemList [
	self startOrderedList 
]

{ #category : #sections }
CVGHtmlPublicationWriter >> section: aString [

	stream << '<div class="paper">'.
	stream << '<i class="material-icons" style="color:#1565c0">school</i>'.
	super section: aString.
	stream << '</div>'
]

{ #category : #sections }
CVGHtmlPublicationWriter >> subSection: aString [
	self title: aString h: 'h5' class: 'blue-title'.
"	stream << '<hr class=""blue-hr"">'"

]

{ #category : #links }
CVGHtmlPublicationWriter >> url: aString labeled: aName [
	|str|
	str := WriteStream on: String new.
	str << '<a href="'.
	str << aString.
	str << '" target=_blank>'.
	str << '<i class="material-icons md-18">picture_as_pdf</i>'.
	str << '</a>'.
	self span: str contents class: 'paper-pdf'
	
]

{ #category : #sections }
CVGHtmlPublicationWriter >> writeContributionNumbers: anInteger [
	stream << anInteger printString.
	stream space.
	stream << ' contributions.'.
	stream << '</br>'
]
