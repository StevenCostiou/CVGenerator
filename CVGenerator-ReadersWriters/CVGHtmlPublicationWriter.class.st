"
I specialize specific writing behavior for HTML themes
"
Class {
	#name : #CVGHtmlPublicationWriter,
	#superclass : #CVGHtmlWriter,
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #sections }
CVGHtmlPublicationWriter >> section: aString [

	stream << '<div class="paper">'.
	stream << '<i class="material-icons" style="color:#1565c0">school</i>'.
	super section: aString.
	stream << '</div>'
]

{ #category : #sections }
CVGHtmlPublicationWriter >> subSection: aString [
	self title: aString h: 5 class: 'blue-title'.
	stream << '<hr class="blue-hr">'

]

{ #category : #links }
CVGHtmlPublicationWriter >> url: aString labeled: aName [
	|str|
	str := WriteStream on: String new.
	str << '<a href="'.
	str << aString.
	str << '">'.
	str << '<i class="material-icons md-18">picture_as_pdf</i>'.
	str << '</a>'.
	self span: str contents class: 'paper-pdf'
	
]
