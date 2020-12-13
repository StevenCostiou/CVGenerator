Class {
	#name : #CVGMandateType,
	#superclass : #CVGAdminType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGMandateType >> isMandate [ ^true
]

{ #category : #'as yet unclassified' }
CVGMandateType >> typeKey [ ^#mandate
]

{ #category : #'as yet unclassified' }
CVGMandateType >> typeName [ ^#('Mandats électifs' 'Elective mandates')
]
