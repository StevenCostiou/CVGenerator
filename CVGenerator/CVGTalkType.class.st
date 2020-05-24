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

{ #category : #'as yet unclassified' }
CVGTalkType >> isConference [ ^false
]

{ #category : #'as yet unclassified' }
CVGTalkType >> isKeynote [ ^false
]

{ #category : #'as yet unclassified' }
CVGTalkType >> isSeminar [ ^false
]

{ #category : #'as yet unclassified' }
CVGTalkType >> isTool [ ^false
]

{ #category : #'as yet unclassified' }
CVGTalkType >> isVulgarization [ ^false
]
