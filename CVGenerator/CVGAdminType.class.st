Class {
	#name : #CVGAdminType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGAdminType class >> contribution [ ^CVGContributionType new
]

{ #category : #'as yet unclassified' }
CVGAdminType class >> lc [ ^CVGLCType new
]

{ #category : #'as yet unclassified' }
CVGAdminType class >> mandate [ ^CVGMandateType new
]

{ #category : #'as yet unclassified' }
CVGAdminType class >> member [ ^CVGMemberType new
]

{ #category : #'as yet unclassified' }
CVGAdminType class >> pc [ ^CVGPCType new
]

{ #category : #'as yet unclassified' }
CVGAdminType class >> reviewer [ ^CVGReviewerType new
]

{ #category : #'as yet unclassified' }
CVGAdminType class >> service [ ^CVGAdminServiceType new
]

{ #category : #'as yet unclassified' }
CVGAdminType class >> sessionchair [ ^CVGSessionChairType new
]

{ #category : #'as yet unclassified' }
CVGAdminType class >> volunteer [ ^CVGVolunteerType new
]

{ #category : #'as yet unclassified' }
CVGAdminType >> isAdminService [ ^false
]

{ #category : #'as yet unclassified' }
CVGAdminType >> isContribution [ ^false
]

{ #category : #'as yet unclassified' }
CVGAdminType >> isMandate [ ^false
]

{ #category : #'as yet unclassified' }
CVGAdminType >> isMember [ ^false
]

{ #category : #'as yet unclassified' }
CVGAdminType >> isService [ ^false
]
