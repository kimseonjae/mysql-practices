from emaillistapp import model

def run_list():
    results = model.findall()

    for index, result in enumerate(results):
        print(f'{index+1}:{result["first_name"]} {result["last_name"]}:{result["email"]}')

def run_add():
    firstname = input('first name : ')
    lastname = input('last name : ')
    email = input('email : ')

    model.insert(firstname, lastname, email)

    run_list()

def run_delete():
    email = input('email : ')
    model.deletebyemail(email)

    run_list()

def main():
    while True:
        cmd = input(f'(l)list, (a)dd, (d)elete, (q)uit >>> ')

        if cmd == 'q':
            break
        elif cmd == 'l':
            run_list()
        elif cmd == 'a':
            run_add()
        elif cmd == 'd':
            run_delete()
        else:
            print('Unkown system...')

if __name__ == '__main__':
    main()