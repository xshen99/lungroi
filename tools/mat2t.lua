require 'mattorch'

io.write('Enter .mat file path:\n')
local line = io.read()
mfile = mattorch.load(line)
io.write('Enter .t7 file path:\n')
line = io.read()
torch.save(line, mfile)
