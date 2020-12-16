"
I represent a tool presentation talk type
"
Class {
	#name : #CVGTalkTool,
	#superclass : #CVGTalkType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGTalkTool >> isTool [ ^true
]

{ #category : #accessing }
CVGTalkTool >> typeKey [ ^#tool
]

{ #category : #accessing }
CVGTalkTool >> typeName [ ^#('Présentation d''outils' 'Tool presentations')
]
