extends Node2D

func AddStep():
	Variables.steps += 1
	if Variables.steps >= 100:
		Variables.calories_score += 1
		Variables.steps = 0
	$score.text = str(Variables.calories_score)
	$Next.value = Variables.steps
