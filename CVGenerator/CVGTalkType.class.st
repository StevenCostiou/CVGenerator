"
I represent the abstract type of a talk.
"
Class {
	#name : #CVGTalkType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGTalkType class >> conference [ ^CVGTalkConference new
]

{ #category : #'as yet unclassified' }
CVGTalkType class >> keynote [ ^CVGTalkKeynote new
]

{ #category : #'as yet unclassified' }
CVGTalkType class >> seminar [ ^CVGTalkSeminar new
]

{ #category : #'as yet unclassified' }
CVGTalkType class >> tool [ ^CVGTalkTool new
]

{ #category : #'as yet unclassified' }
CVGTalkType class >> vulgarization [ ^CVGTalkVulgarization new
]

{ #category : #testing }
CVGTalkType >> isConference [ ^false
]

{ #category : #testing }
CVGTalkType >> isKeynote [ ^false
]

{ #category : #testing }
CVGTalkType >> isSeminar [ ^false
]

{ #category : #testing }
CVGTalkType >> isTool [ ^false
]

{ #category : #testing }
CVGTalkType >> isVulgarization [ ^false
]
