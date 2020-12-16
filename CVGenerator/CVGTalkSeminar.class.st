"
I represent a seminar talk type
"
Class {
	#name : #CVGTalkSeminar,
	#superclass : #CVGTalkType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #accessing }
CVGTalkSeminar >> isSeminar [ ^true
]

{ #category : #accessing }
CVGTalkSeminar >> typeKey [ ^#seminar
]

{ #category : #accessing }
CVGTalkSeminar >> typeName [ ^#('Séminaires académiques et industriels' 'Academic and industrial seminars')
]
