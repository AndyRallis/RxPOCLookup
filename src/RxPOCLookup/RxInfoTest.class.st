Class {
	#name : #RxInfoTest,
	#superclass : #TestCase,
	#instVars : [
		'rxInfo'
	],
	#category : #'RxPOCLookup-Test'
}

{ #category : #running }
RxInfoTest >> setUp [
	| a b c |
	super setUp.
	a := Rx new 
		ndcnum: '1234567'; gennme: 'Drug 1 - Gen'; prodnme: 'Drug 1 - Brand'.
	b := Rx new 
		ndcnum: '1234567'; gennme: 'Drug 2 - Gen'; prodnme: 'Drug 2 - Brand'.
	c := Rx new 
		ndcnum: '1234567'; gennme: 'Drug 2 - Gen'; prodnme: 'Drug 2 - Brand'.
	rxInfo := RxInfo new rxList: (OrderedCollection new add:a; add: b; add: c; yourself)
]

{ #category : #tests }
RxInfoTest >> testFuzzyLookup [
	| key result |
	key := 'rug 1'.
	result := rxInfo findDrug: key.
	self assert: result equals: 'Drug 1 - Gen'
]
