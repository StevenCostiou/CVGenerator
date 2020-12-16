"
I represent a vulgarization talk type
"
Class {
	#name : #CVGTalkVulgarization,
	#superclass : #CVGTalkType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGTalkVulgarization >> isVulgarization [ ^true
]

{ #category : #accessing }
CVGTalkVulgarization >> typeKey [ ^#vulgarization
]

{ #category : #accessing }
CVGTalkVulgarization >> typeName [ ^#('Vulgarisation' 'Vulgarization')
]
