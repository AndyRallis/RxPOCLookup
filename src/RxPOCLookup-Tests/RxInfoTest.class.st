Class {
	#name : #RxInfoTest,
	#superclass : #TestCase,
	#instVars : [
		'rxInfo'
	],
	#category : #'RxPOCLookup-Tests'
}

{ #category : #running }
RxInfoTest >> setUp [
	| a b c d e f tempRxList |
	super setUp.
	a := Rx new
		ndcnum: '1234567';
		gennme: 'Drug 1 - Gen';
		prodnme: 'Drug 1 - Brand'.
	b := Rx new
		ndcnum: '1';
		gennme: 'Drug 2 - Gen';
		prodnme: 'Drug 2 - Brand'.
	c := Rx new
		ndcnum: '2';
		gennme: 'Drug 2 - Gen';
		prodnme: 'Drug 2 - Brand'.
	d := Rx new
		ndcnum: '3';
		gennme: 'Drug 2 - Gen';
		prodnme: 'Drug 2 - Brand'.
	e := Rx new
		ndcnum: '4';
		gennme: 'Drug 2 - Gen';
		prodnme: 'Drug 2 - Brand'.
	f := Rx new
		ndcnum: '5';
		gennme: 'Drug 2 - Gen';
		prodnme: 'Drug 2 - Brand'.
	tempRxList := {a.
	b.
	c.
	d.
	e.
	f}.
	rxInfo := RxInfo new
		rxList: (tempRxList groupedBy: [ :rx | rx prodnme asUppercase ]).
	rxInfo drugNameList
]

{ #category : #tests }
RxInfoTest >> testFindDrug [
	| key result |
	key := 'rug 1'.
	result := rxInfo findDrug: key.
	self assert: (result first) equals: 'Drug 1 - brand'
]

{ #category : #tests }
RxInfoTest >> testFindExactDrug [
	| key rxResult |
	key := 'Drug 2 - Brand'.
	rxResult := rxInfo findExactDrug: key.
	self assert: rxResult first prodnme equals: 'Drug 2 - brand'
]

{ #category : #tests }
RxInfoTest >> testFindExactDrugNotPreset [
	| key rxResult |
	key := 'Drug 1 - fsdfd'.
	rxResult := rxInfo findExactDrug: key.
	self assert: rxResult equals: #()
]

{ #category : #test }
RxInfoTest >> testFindTopDrugMatchKey [
	| key result |
	key := 'rug'.
	result := rxInfo findTopDrugMatch: 2 key: key.
	self assert: result size equals: 2
]

{ #category : #tests }
RxInfoTest >> testFuzzyLookupBlank [
	| key result |
	key := 'rug - 1'.
	result := (rxInfo findDrug: key).
	self assert: result equals: Array new
]

{ #category : #tests }
RxInfoTest >> testPullTopDrugsTwo [
	| key result |
	key := 'rug'.
	result := rxInfo findTopDrugMatch: 2 key: key.
	self assert: result size equals: 2
]
