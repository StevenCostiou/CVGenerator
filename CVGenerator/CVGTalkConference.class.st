"
I represent a conference talk type
"
Class {
	#name : #CVGTalkConference,
	#superclass : #CVGTalkType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGTalkConference >> isConference [ ^true
]

{ #category : #accessing }
CVGTalkConference >> typeKey [ ^#conference
]

{ #category : #accessing }
CVGTalkConference >> typeName [ ^'International conferences'
]
