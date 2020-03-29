"
I am a utility class.
I read a collection of CVGAuthor from a string formatted as follows: 
Author1_name Author1_surname, Author2_name Author2_surname, Author3_name Author3_surname
"
Class {
	#name : #CVGAuthorReader,
	#superclass : #Object,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGAuthorReader class >> readAuthorsFrom: aString [
	| authorsNames |
	authorsNames := aString findTokens: $,.
	^ authorsNames
		collect: [ :authNames | 
			| names |
			names := authNames findTokens: Character space.
			CVGAuthor new
				name: names first;
				surname: names last;
				yourself ]
]
