Class {
	#name : #RxResult,
	#superclass : #Object,
	#instVars : [
		'match',
		'selectedRx'
	],
	#category : #RxPOCLookup
}

{ #category : #'as yet unclassified' }
RxResult class >> matchList: aDrugList match: isMatch [
		isMatch 
			ifTrue: [ ^ self new match: isMatch; selectedRx: aDrugList ]
			ifFalse: [ ^ self new match: isMatch; selectedRx: OrderedCollection new ]
		
]

{ #category : #accessing }
RxResult >> match [
	^ match
]

{ #category : #accessing }
RxResult >> match: isMatch [
	match := isMatch
]

{ #category : #accessing }
RxResult >> selectedRx [
	^ selectedRx
]

{ #category : #accessing }
RxResult >> selectedRx: aSelectedList [
	selectedRx := aSelectedList
]
