
# エラー処理なんて絶対にしないぞ！！！！！！！！！！！！！

require! {
	\http
	\child_process
	\express
}

app = express!

app.get \/read, (req, res) ->
	pbpaste = child_process.spawn \pbpaste
	pbpaste.stdout.pipe res

app.post \/write, (req, res) ->
	text = req.params.text or null
	pbcopy = child_process.spawn \pbcopy
	pbcopy.stdin.write text
	pbcopy.stdin.end!
	res.end \OK
	
server = http.createServer app
server.listen process.env.PORT