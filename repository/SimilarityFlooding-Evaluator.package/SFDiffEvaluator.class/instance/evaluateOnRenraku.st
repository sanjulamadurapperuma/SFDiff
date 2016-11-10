evaluation
evaluateOnRenraku
	"Evaluate the diff precision on Renraku (https://github.com/Uko/Renraku) v0.10.0 and v0.11.0"
	| diff expectedChanges actualChanges timeToRun |
	diff := nil. "Avoid warning: 'Temporaries readbefore written', this is done deliberately."
	timeToRun := [
		diff := SFDiff new
					baseModel: self renrakuV0100Model;
					targetModel: self renrakuV0110Model;
					matchThreshold: 0.001;
					computeDiff;
					yourself
	] timeToRun.
	expectedChanges := self renrakuExpectedChanges.
	"Only these kind of entities are in the expected changes."
	actualChanges := diff changes select: [ :change | {FAMIXClass . FAMIXMethod . FAMIXAttribute} includes: change entity class ]. 
	
	^ SFDiffEvaluationResult new
			expectedChanges: expectedChanges;
			actualChanges: (actualChanges reject: #isVersion);
			timeToCompute: timeToRun;
			yourself