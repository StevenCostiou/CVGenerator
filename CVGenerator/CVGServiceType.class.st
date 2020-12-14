Class {
	#name : #CVGServiceType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGServiceType class >> lc [ ^CVGLCType new
]

{ #category : #'as yet unclassified' }
CVGServiceType class >> pc [ ^CVGPCType new
]

{ #category : #'as yet unclassified' }
CVGServiceType class >> reviewer [ ^CVGReviewerType new
]

{ #category : #'as yet unclassified' }
CVGServiceType class >> sessionChair [ ^CVGSessionChairType new
]

{ #category : #'as yet unclassified' }
CVGServiceType class >> volunteer [ ^CVGVolunteerType new
]

{ #category : #'as yet unclassified' }
CVGServiceType >> isLC [ ^false
]

{ #category : #'as yet unclassified' }
CVGServiceType >> isPC [ ^false
]

{ #category : #'as yet unclassified' }
CVGServiceType >> isReviewer [ ^false
]

{ #category : #'as yet unclassified' }
CVGServiceType >> isSessionChair [ ^false
]

{ #category : #'as yet unclassified' }
CVGServiceType >> isVolunteer [ ^false
]
