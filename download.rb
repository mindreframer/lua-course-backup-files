ready = ["00Introduction.pdf", "01GettingStarted.pdf", "02Types.pdf", "03ControlFlow.pdf", "04Functions.pdf", "05DataStructures.pdf", "06MoreFunctions.pdf", "07Iterators.pdf", "08HandlingErrors.pdf", "09Modules.pdf", "10Metatables.pdf", "11Objects.pdf", "12APIBasics.pdf", "13Embedding.pdf", "14Extending.pdf", "15Userdata.pdf", "16Implementation.pdf"]
ready.each {|x| puts  "wget http://www.dcc.ufrj.br/~fabiom/lua/#{x}"}


code_urls = (1..9).to_a.map{|x| "code#{x}.zip"}.map{|x| "http://www.dcc.ufrj.br/~fabiom/lua/#{x}"}
code_urls.each { |e| puts "wget #{e}" }