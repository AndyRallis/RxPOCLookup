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
			ifTrue: [ ^ self new match: isMatch; selectedRx: aDrugList first ]
			ifFalse: [ ^ self new match: isMatch ]
		
]

{ #category : #accessing }
RxResult >> drugName [
	self match
		ifTrue: [ ^ selectedRx prodnme ]
		ifFalse: ''
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
RxResult >> selectedRx: aDrug [ 
	selectedRx := aDrug
]
