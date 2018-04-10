matio = require "matio"

io.write('Enter .t7 file path:\n')
local line = io.read()
data = torch.load(line)
io.write('Enter .mat file path:\n')
line = io.read()
matio.save(line, data)
