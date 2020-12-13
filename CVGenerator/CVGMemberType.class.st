Class {
	#name : #CVGMemberType,
	#superclass : #CVGAdminType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #visiting }
CVGMemberType >> acceptGenerator: aCVGGenerator for: aCVGAdmin [
	aCVGGenerator generateMandate: aCVGAdmin
]

{ #category : #'as yet unclassified' }
CVGMemberType >> isMember [ ^true
]

{ #category : #'as yet unclassified' }
CVGMemberType >> typeKey [ ^#member
]

{ #category : #'as yet unclassified' }
CVGMemberType >> typeName [ ^#('Conseils' 'Committees')
]
