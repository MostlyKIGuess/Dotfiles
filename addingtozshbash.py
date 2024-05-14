import os

def add_lines_to_rc_file(lines, rc_file):
    with open(rc_file, 'a') as file:
        for line in lines:
            file.write(line + '\n')

def add_to_shell_rc(lines):
    home_dir = os.path.expanduser("~")
    zshrc_file = os.path.join(home_dir, ".zshrc")
    bashrc_file = os.path.join(home_dir, ".bashrc")

    add_lines_to_rc_file(lines, zshrc_file)
    add_lines_to_rc_file(lines, bashrc_file)

def main():
    input_lines = []

    input_type = input("Enter 'file' if input is a file, or 'string' for direct input: ")

    if input_type.lower() == 'file':
        file_path = input("Enter the file path: ")
        try:
            with open(file_path, 'r') as file:
                input_lines.extend(file.readlines())
        except FileNotFoundError:
            print("File not found.")
            return
    elif input_type.lower() == 'string':
        lines_count = int(input("Enter number of lines you want to add: "))
        for i in range(lines_count):
            line = input(f"Enter line {i+1}: ")
            input_lines.append(line)
    else:
        print("Invalid input type.")
        return

    add_to_shell_rc(input_lines)
    print("Lines added to .zshrc and .bashrc successfully.")

if __name__ == "__main__":
    main()
