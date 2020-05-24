"
I represent a keynote talk type
"
Class {
	#name : #CVGTalkKeynote,
	#superclass : #CVGTalkType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGTalkKeynote >> isKeynote [ ^true
]

{ #category : #accessing }
CVGTalkKeynote >> typeKey [ ^#keynote
]

{ #category : #accessing }
CVGTalkKeynote >> typeName [ ^'Keynotes'
]
