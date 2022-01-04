# Remove the generated Coq files 

if ARGV.size < 3 then
  puts "Usage:"
  puts "  ruby cleanup.rb easier_proofs_path examples_path target_path"
  exit(1)
end

easier_proofs_path, examples_path, target_path = ARGV
full_path = File.join(easier_proofs_path, examples_path, target_path)

# Remove

remove_files =
  Dir.glob(File.join(full_path, "*.v")) 
for coq_file_name in remove_files.sort do
    command = "cd #{full_path} && rm -rf #{File.basename(coq_file_name)}"
  system(command)
end