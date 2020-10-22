"
I represent a perscription drug with NDC number, name and package size. I'm usually found in an RxInfo group which is a list of Rx data.
"
Class {
	#name : #Rx,
	#superclass : #Object,
	#instVars : [
		'ndcnum',
		'prodnme',
		'gennme',
		'pksize',
		'strngth',
		'mstfmds'
	],
	#category : #RxPOCLookup
}

{ #category : #accessing }
Rx >> gennme [
	^ gennme
]

{ #category : #accessing }
Rx >> gennme: anObject [
	gennme := anObject
]

{ #category : #accessing }
Rx >> mstfmds [
	^ mstfmds
]

{ #category : #accessing }
Rx >> mstfmds: anObject [
	mstfmds := anObject
]

{ #category : #accessing }
Rx >> ndcnum [
	^ ndcnum
]

{ #category : #accessing }
Rx >> ndcnum: anObject [
	ndcnum := anObject
]

{ #category : #accessing }
Rx >> pksize [
	^ pksize
]

{ #category : #accessing }
Rx >> pksize: anObject [
	pksize := anObject
]

{ #category : #accessing }
Rx >> prodnme [
	^ prodnme
]

{ #category : #accessing }
Rx >> prodnme: anObject [
	prodnme := anObject
]

{ #category : #accessing }
Rx >> strngth [
	^ strngth
]

{ #category : #accessing }
Rx >> strngth: anObject [
	strngth := anObject
]
