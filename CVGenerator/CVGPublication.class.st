"
I represent a publication.

type = journal, conference, workshop, book, thesis, other
"
Class {
	#name : #CVGPublication,
	#superclass : #Object,
	#instVars : [
		'type',
		'title',
		'authors',
		'publisher',
		'year',
		'doi',
		'link'
	],
	#category : #CVGenerator
}
