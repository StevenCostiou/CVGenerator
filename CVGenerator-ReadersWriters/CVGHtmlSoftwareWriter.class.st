"
I specialize specific writing behavior for HTML themes
"
Class {
	#name : #CVGHtmlSoftwareWriter,
	#superclass : #CVGHtmlWriter,
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #lists }
CVGHtmlSoftwareWriter >> itemListMark [
	^'ol'
]

{ #category : #sections }
CVGHtmlSoftwareWriter >> section: aString [

	stream << '<div class="paper">'.
	stream << '<i class="material-icons" style="color:#1565c0">save</i>'.
	super section: aString.
	stream << '</div>'
]

{ #category : #sections }
CVGHtmlSoftwareWriter >> subSection: aString [
	self title: aString h: 5 class: 'blue-title'.
	stream << '<hr class="blue-hr">'
]

{ #category : #links }
CVGHtmlSoftwareWriter >> url: aString labeled: aName [
	|str|
	str := WriteStream on: String new.
	str << '<a href="'.
	str << aString.
	str << '" target=_blank>'.
	str << '<i class="material-icons md-18">storage</i>'.
	str << '</a>'.
	self span: str contents class: 'paper-pdf'
]
