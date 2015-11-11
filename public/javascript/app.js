var main = function(){
	$('.makeblue').click(function(){
		// $('#test').removeClass('')
		$('#test').text('It made it blue!')
		$('#test').css({'color':'blue'})
	})
	$('.makered').click(function(){
		// $('#test').removeClass('')
		$('#test').text('It made it red!')
		$('#test').css({'color':'red'})
	})
	$('.reset').click(function(){
		// $('#test').removeClass('')
		$('#test').text('Normal.')
		$('#test').css({'color':'black'})
	})
}

$(document).ready(main)
