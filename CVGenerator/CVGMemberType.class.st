Class {
	#name : #CVGMemberType,
	#superclass : #CVGAdminType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGMemberType >> isMember [ ^true
]

{ #category : #'as yet unclassified' }
CVGMemberType >> typeKey [ ^#member
]

{ #category : #'as yet unclassified' }
CVGMemberType >> typeName [ ^#('Conseils' 'Committees')
]
